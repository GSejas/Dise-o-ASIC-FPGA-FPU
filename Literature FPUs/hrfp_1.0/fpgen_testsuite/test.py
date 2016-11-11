#!/usr/bin/python
# A small script that parses the files presented in IBM's FPgen testsuite
# available for download at https://www.research.ibm.com/haifa/projects/verification/fpgen/ieeets.html
# and present the data in a manner which is more easily parsed when dealing with 
# verification of IEEE-754 compatible hardware units.
# 
# Author: Andreas Ehliar <ehliar@isy.liu.se>
# Disclaimer: I'm not affiliated with the FPgen project or IBM in any way
# License for this script: MIT (http://opensource.org/licenses/MIT)
#
# Example input/output:
# Input: (from fptest files)
# b32+ =0 x -1.662752P62 +1.518000P50 -> -1.661A3AP62 
# b32* =0 x -1.618000P-55 +1.026600P106 -> -1.65B9B2P51 
# Output:
# ADD: dee62752 58d18000 dee61a3a
# MUL: a4618000 74826600 d965b9b2
#
# Note: The script is very much tailored to my needs, and ignores some
# cases which doesn't make sense for a dedicated floating point
# operator in an FPGA or ASIC such as exceptions, signalling/quiet
# NaNs, etc.

import sys

def conv_to_binary(x):
    sign = 0
    subnormal = False
    if x == '+Inf':
        return 0x7f800000
    elif x == '-Inf':
        return 0xff800000
    elif x == '+Zero':
        return 0x00000000
    elif x == '-Zero':
        return 0x80000000
    elif x == 'Q':        # Don't care about signalling/quiet NaN conversion
        return 0xffffffff
    elif x == 'S':
        return 0xffffffff


    if x[0] == '-':
        sign = 0x80000000

    tmp = x.split('P')
    exponent = tmp[1]
    if exponent == '-126' and x[1] == '0':
        subnormal = True

    exponent = int(exponent) + 127

    foo = tmp[0].split('.')
    mantissa = int(foo[1],16)

    if subnormal:
        exponent = 0

    if subnormal:
        return mantissa | sign
    
    return mantissa | (exponent << 23) | sign

    


for l in sys.stdin.readlines():
    f = l.split(' ')
    f.append('                ') # Ugly hack to avoid ugly checks later down.
    doadd = False
    dosub = False
    domul = False
    
    if f[0] == 'b32+':
        doadd = True
    elif f[0] == 'b32-':
        dosub = True
    elif f[0] == 'b32*':
        domul = True

    # If the rounding mode is not round to nearest even the test is ignored.
    if f[1] != '=0':
        domul = False
        doadd = False
        dosub = False


    
        
    if doadd or dosub or domul:
        num1 = f[2]
        num2 = f[3]
        separator = f[4]
        result = f[5]
        if (num1[0] != '+') and (num1[0] != '-'):
            # Enabled exceptions here:
            num1 = f[3]
            num2 = f[4]
            separator = f[5]
            result = f[6]

            if (f[2].find('o') >= 0 ) and (f[7].find('o') >= 0):
                domul = False
                doadd = False
                dosub = False
                separator=False
                # We do not handle the case where get an (enabled)
                # overflow exception since we expect an Inf in this
                # case.

            if (f[2].find('u') >= 0 ) and (f[7].find('u') >= 0):
                domul = False
                doadd = False
                dosub = False
                separator=False
                # We do not handle the case where get an (enabled)
                # underflow/inexact exception since we don't have
                # such output flags...

        if separator == '->' and result != '#':

    
            num1 = conv_to_binary(num1)
            num2 = conv_to_binary(num2)
            result = conv_to_binary(result)
            if dosub:
                num2 = num2 ^ 0x80000000
    
            if domul:
                print 'MUL: %08x %08x %08x' % (num1, num2, result)
            else:
                print 'ADD: %08x %08x %08x' % (num1, num2, result)

