--============================================================================--
-- Design unit  : Package pci_arb_pkg, entity pci_arb
--
-- File name    : pci_arb.vhd
--
-- Purpose      : Arbiter for the PCI bus
--                - configurable size: 4, 8, 16, 32 agents
--                - round-robbing in configurable (up to 4) priority levels
--                - priority assignment hard-coded or APB-programmable
--                 
--
-- Reference    : PCI Local Bus Specification, Revision 2.1,
--                PCI Special Interest Group, 1st June 1995
--                (for information: http: 
-- Reference    : AMBA(TM) Specification (Rev 2.0), ARM IHI 0011A,
--                13th May 1999, issue A, first release, ARM Limited
--                The document can be retrieved from http: 
--
-- Note         : All the numbering referring to the different PCI agents, 
--                such as arrays for req_n, gnt_n, or priority levels is in
--                increasing order <0 = left> to <NUMBER-1 = right>.
--                APB data/address arrays are in the conventional order: 
--                The least significant bit is located to the
--                right, carrying the lower index number (usually 0).
--                
-- Configuration: The arbiter is configurable by the constants ARB_SIZE and
--                ARB_LEVELS in pci_arb_pkg. ARB_SIZE is the log dualis (ld)
--                of the number of agents, which can be connected to the bus.
--                Values 2, 3, 4, 5 result in NB_AGENTS = 4, 8, 16 or 32.
--                ARB_LEVELS specifies the number of arbitration levels,
--                according to algorithm described below. The value should
--                not exceed 4, to prevent excessive synthesis areas.
--                The priority levels are hard-coded, when APB_PRIOS = false.
--                In this case, the APB ports (pbi/pbo) are unconnected.
--                When APB_PRIOS = true, the levels are programmable via APB.
--                Note: The combination of ARB_LEVELS = 4, ARB_SIZE = 5 with
--                programmable priorities leads to an excessively large
--                arbiter and problems making timing - it should be avoided.
--                
-- Algorithm    : The algorithm is described in the implementation note of
--                section 3.4 of the PCI standard:
--                The bus is granted by a configurable multi-level and round-
--                robbing algorithm. An agent number and an arbitration level
--                is assigned to each agent. The agent number determines,
--                which pair of req_n/gnt_n lines the agent uses. Agents
--                are counted from 0 to NB_AGENTS-1.
--                All agents in one level have equal access to the bus
--                (round-robbing); all agents of level N+1 as a group have
--                equal access as each agent of the next higher level N.
--                Re-arbitration occurs, when frame_n is asserted, as soon
--                as any other master has requested the bus, but only
--                once per transaction.
--                
-- Prioriy levels: Priority levels are numbered starting from 0 (highest
--                priority) to ARB_LEVELS-1 (lowest priority).
--                Agent NB_AGENTS-1 is always in the group ARB_LEVELS-1.
--                Agents 0 to NB_AGENTS-2 can be assigned in any order to a
--                level between 0 and ARB_LEVELS-1, fixed or programmable:
--                a) APB_PRIOS = false: Fixed, hard-coded priorities for the
--                   different devices. A priority level is assigned to each
--                   device by the constant ARB_LVL_C in pci_arb_pkg.
--                b) With programmable priorities. The priority level of all
--                   agents (except NB_AGENTS-1) is  programmable via APB.
--                   In a 256 byte APB address range, the priority level of
--                   agent N is accessed via the address 0x80 + 4*N. The APB
--                   slave returns 0 on all non-implemented addresses, the
--                   address bits (1:0) are not decoded. Since only addresses
--                   >= 0x80 are occupied, it can be used in parallel (ored
--                   read data) with our PCI interface (uses <= 0x78).
--                   The constant ARB_LVL_C in pci_arb_pkg is the reset value.
--
-- Timeout:       The "broken master" timeout is another reason for
--                re-arbitration (section 3.4.1 of the standard). Grant is
--                removed from an agent, which has not started a cycle
--                within 16 cycles after request (and grant). Reporting of
--                such a 'broken' master is not implemented.
--
-- Turnover:      A turnover cycle is required by the standard, when re-
--                arbitration occurs during idle state of the bus.
--                Notwithstanding to the standard, "idle state" is assumed,
--                when frame_n is high for more than 1 cycle.
--
-- Bus parking  : The bus is parked to agent 0 after reset, it remains granted
--                to the last owner, if no other agent requests the bus.
--                When another request is asserted, re-arbitration occurs
--                after one turnover cycle.
--
-- Lock         : Lock is defined as a resource lock by the PCI standard.
--                The optional bus lock mentioned in the standard is not
--                considered here and there are no special conditions to
--                handle when lock_n is active.
--                in arbitration.
--
-- Latency      : Latency control in PCI is via the latency counters of each
--                agent. The arbiter does not perform any latency check and
--                a once granted agent continues its transaction until its
--                grant is removed AND its own latency counter has expired.
--                Even though, a bus re-arbitration occurs during a
--                transaction, the hand-over only becomes effective,
--                when the current owner deasserts frame_n.
--
-- Limitations  : [add here known bugs and limitations]
-- 
-- Library      : work
--
-- Dependencies : package pci_arb_pkg (contained in this file)
--                package amba, can be retrieved from:
--                http: 
--
-- Author       : Roland Weigand  <weigand@ws.estec.esa.nl>
--                European Space Agency (ESA)
--                Microelectronics Section (TOS-ESM)
--                P.O. Box 299
--                NL-2200 AG Noordwijk ZH
--                The Netherlands
--
-- Contact      : mailto:microelectronics@estec.esa.int
--                http: 
--
-- Copyright (C): European Space Agency (ESA) 2000. 
--                This source code is free software; you can redistribute it 
--                and/or modify it under the terms of the GNU Lesser General 
--                Public License as published by the Free Software Foundation; 
--                either version 2 of the License, or (at your option) any 
--                later version. For full details of the license see file
--                http: 
--
--                It is recommended that any use of this VHDL source code is
--                reported to the European Space Agency. It is also recommended 
--                that any use of the VHDL source code properly acknowledges the 
--                European Space Agency as originator. 
--
-- Disclaimer   : All information is provided "as is", there is no warranty that
--                the information is correct or suitable for any purpose,
--                neither implicit nor explicit. This information does not
--                necessarily reflect the policy of the European Space Agency.
--
-- Simulator    : Modelsim 5.4 on PC + Windows 95
--
-- Synthesis    : Synopsys Version 1999.10 on Sparc + Solaris 5.5.1
-- 
--------------------------------------------------------------------------------
-- Version  Author        Date         Changes
--
-- 0.0      R.Weigand     2000/11/02   File created
-- 0.1      J.Gaisler     2001/04/10   Integrated in LEON
-- 0.2      R. Weigand    2001/04/25   Connect arb_lvl reg to AMBA clock/reset
--------------------------------------------------------------------------------

   


library IEEE;
use IEEE.std_logic_1164.all;
use work.config.all;
package pci_arb_pkg is
   -- The number of agents can be only 4, 8, 16, 32
--   constant ARB_SIZE : natural range 2 to 5 := 2;  -- (4, 8, 16, 32) devices
--   constant ARB_LEVELS : positive range 1 to 4 := 2;  -- arbitration levels
--   constant APB_PRIOS : boolean := true;  -- true: levels programmable via APB
   
--   constant NB_AGENTS : natural range 3 to 32 := 2**ARB_SIZE;  -- Nb. of PCI agents
   subtype agent_t is natural range 0 to NB_AGENTS-1;
   subtype level_t is natural range 0 to ARB_LEVELS-1;
   type owner_t is array (0 to ARB_LEVELS-1) of agent_t;        -- last owner of each level
   type arb_lvl_t is array (0 to NB_AGENTS-2) of level_t;

   -- Note: the agent with the highest index (3, 7, 15, 31) is always in the
   -- arbitration level with the highest index!!
   constant ARB_LVL_C : arb_lvl_t := (  -- default values for arb-level
      others => 0                       -- default is zero
      );

   constant all_ones : std_logic_vector(0 to NB_AGENTS-1) := (others => '1');

end pci_arb_pkg;

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.conv_integer;
use IEEE.std_logic_arith.all;
use work.pci_arb_pkg.all;
use work.config.all;
use work.amba.all;
use work.iface.all;
entity pci_arb is
   
   port (clk     : in  std_logic ;                              -- clock
         rst_n   : in  std_logic;                           -- async reset active low
         req_n   : in  std_logic_vector(0 to NB_AGENTS-1);  -- bus request
         frame_n : in  std_logic;
         gnt_n   : out std_logic_vector(0 to NB_AGENTS-1);  -- bus grant
         pclk    : in  clk_type;                            -- APB clock
         prst_n  : in  std_logic;                           -- APB reset
         pbi     : in  APB_Slv_In_Type;                     -- APB inputs
         pbo     : out APB_Slv_Out_Type                     -- APB outputs
         );

end pci_arb;

-- purpose: PCI arbiter
architecture rtl of pci_arb is
   signal owner, owneri : owner_t;  -- current owner per level
   signal cown, cowni   : agent_t;  -- current level
   signal rearb, rearbi : std_logic;            -- re-arbitration flag
   signal tout, touti   : natural range 0 to 15 := 0;  -- timeout counter
   signal turn, turni   : std_logic;            -- turnaround cycle
   signal arb_lvl, arb_lvli : arb_lvl_t := ARB_LVL_C;  -- level registers

   
begin  -- rtl
   
   ----------------------------------------------------------------------------
   -- PCI ARBITER 
   ----------------------------------------------------------------------------
   -- purpose: Grants the bus depending on the request signals. All agents have
   -- equal priority, if another request occurs during a transaction, the bus is
   -- granted to the new agent. However, PCI protocol specifies that the master
   -- can finish the current transaction within the limit of its latency timer.
   arbiter : process(cown, owner, req_n, rearb, tout, turn, frame_n, arb_lvl)

      variable new_request    : integer := 0;  -- detected request

      -- Find the next request to be serviced (found)
      -- + update the current owner array    (owneri)
      -- If no request is asserted, found := NB_AGENTS
      procedure find_next (signal   owner  : in  owner_t;
                           level           : in  level_t;
                           signal   req_n  : in  std_logic_vector(0 to NB_AGENTS-1);
                           signal   owneri : out owner_t;
                           variable found  : out natural range 0 to NB_AGENTS
                           ) is

         variable higher, lower: natural range 0 to NB_AGENTS;

      begin                                           -- find_next
         higher := NB_AGENTS;
         lower  := NB_AGENTS;
         rob : for i in 0 to NB_AGENTS-2 loop
            -- find next request with index > current owner, same prio level
            if i > owner(level) then
               if higher = NB_AGENTS and req_n(i) = '0' and arb_lvl(i) = level then
                  higher := i;  -- select new agent > current
                  found  := i;
                  owneri(level) <= i;
               end if;
            -- find next request with index <= current owner
            else
               if lower = NB_AGENTS and req_n(i) = '0' and arb_lvl(i) = level then
                  lower := i;           -- select new agent <= current
                  found := i;           -- overridden, if a 'higher' is foun
                  owneri(level) <= i;   -- overridden, if a 'higher' is found
               end if;
            end if;
         end loop rob;

         -- different processing for the last device (NB_AGENTS-1):
         -- If not in leaf level: step down to next level
         if higher = NB_AGENTS and owner(level) /= NB_AGENTS-1 then
            -- If Not in leaf level: step down to next level
            if level < ARB_LEVELS-1 then
               find_next(owner, level+1, req_n, owneri, higher);
               if higher /= NB_AGENTS then  
                  owneri(level) <= NB_AGENTS-1; -- found in next level
               end if;
            elsif req_n(NB_AGENTS-1) = '0' then
               -- NB_AGENTS-1 has automatically the lowest prio level
               found  := NB_AGENTS-1;  -- select new agent > current
               owneri(level) <= NB_AGENTS-1;
            end if;
         end if;
         
         if higher = NB_AGENTS then     -- round robbing wrapped
            found := lower;
         else
            found := higher;              -- next in line
         end if;
      end find_next;


   begin  -- process arbiter

      -- default assignments
      rearbi <= rearb;
      owneri <= owner;
      cowni  <= cown;
      touti  <= tout;
      turni  <= '0';                    -- no turnaround
      
      -- re-arbitrate once during the transaction,
      -- or when timeout counter expired (bus idle).
      if (frame_n = '0' and rearb = '0') or turn = '1' then
         
         -- determine next owner: recursive procedure,
         -- start search at arbitration level 0
         find_next(owner, 0, req_n, owneri, new_request);
         
         -- rearbitration if any request asserted & different from current owner
         if new_request /= NB_AGENTS and cown /= new_request then
            -- if idle state: turnaround cycle required by PCI standard
            cowni <= new_request;
            touti <= 0;                 -- reset timeout counter
            if turn = '0' then
               rearbi <= '1';           -- only one re-arbitration
            end if;
         end if;
      elsif frame_n = '1' then
         rearbi <= '0';
      end if;

      -- if frame deasserted, but request asserted: count timeout
      if req_n = all_ones then          -- no request: prepare timeout counter
         touti <= 15;
      elsif frame_n = '1' then          -- request, but no transaction
         if tout = 15 then              -- timeout expired, re-arbitrate
            turni <= '1';               -- remove grant, turnaround cycle
            touti <= 0;                 -- next cycle re-arbitrate
         else
            touti <= tout + 1;
         end if;
      end if;

      grant : for i in 0 to NB_AGENTS-1 loop
         if i = cown and turn = '0' then
            gnt_n(i) <= '0';
         else  
            gnt_n(i) <= '1';
         end if;
      end loop grant;

   end process arbiter;

   fixed_prios : if not APB_PRIOS generate
      arb_lvl <= ARB_LVL_C;          -- assign constant value
   end generate fixed_prios;

   -- Generate APB regs and APB slave
   apbgen : if APB_PRIOS generate
      -- purpose: APB read and write of arb_lvl configuration registers
      -- type:    memoryless
      -- inputs:  pbi, arb_lvl
      -- outputs: pbo, arb_lvli
      config : process (pbi, arb_lvl)
         variable arblvl : unsigned(31 downto 0);
      begin  -- process config
         arb_lvli <= arb_lvl;

         pbo.PRDATA <= (others => '0');  -- default for unimplemented addresses
         
         -- register select at (byte-) addresses 0x80 + 4*i
         if pbi.PADDR(7) = '1' and pbi.PSEL = '1' then -- address select
            wrloop : for i in 0 to NB_AGENTS-2 loop
               if (pbi.PWRITE and pbi.PENABLE) = '1' and  -- APB write
                  i = conv_integer(pbi.PADDR(6 downto 2)) then
                  arb_lvli(i) <= conv_integer(pbi.PWDATA(1 downto 0));
               end if;
            end loop wrloop;

            rdloop : for i in 0 to NB_AGENTS-2 loop
               if i = conv_integer(pbi.PADDR(6 downto 2)) then
                  arblvl := conv_unsigned(arb_lvl(i), 32);
                  pbo.PRDATA <= std_logic_vector(arblvl);
               end if;
            end loop rdloop;
         end if;
         
      end process config;


      -- purpose: registers
      -- type:    memorizing
      apb_regs : process (pclk, prst_n)
         
      begin  -- process regs
         -- activities triggered by asynchronous reset (active low)
         if prst_n = '0' then
            arb_lvl <= ARB_LVL_C;          -- assign default value
            -- activities triggered by rising edge of clock

         elsif pclk'event and pclk = '1' then  -- '

            arb_lvl <= arb_lvli;
         end if;
      end process apb_regs;

   end generate apbgen;

    -- purpose: registers
   -- type:    memorizing
   regs0 : process (clk, rst_n)
      
   begin  -- process regs
      -- activities triggered by asynchronous reset (active low)
      if rst_n = '0' then
         tout    <= 0;
         cown    <= 0;
         owner   <= (others => 0);
         rearb   <= '0';
         turn    <= '0';
         -- activities triggered by rising edge of clock
      elsif clk'event and clk = '1' then  -- '
         tout    <= touti;
         owner   <= owneri;
         cown    <= cowni;
         rearb   <= rearbi;
         turn    <= turni;
      end if;
   end process regs0;

end rtl;



