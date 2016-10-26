Before use these files, please take a look on the SCSL license at www.sun.com !
microSparcII can be downloaded there as well.

meiko-1file.v and meiko_refined.v contain the extracted model of Meiko FPU from microSparcII.

The difference between both, is only the size. For meiko_refined.v, the general libraries of microSparcII have been refined.

meiko-1file.v includes following files:
cells.v
ff_primitives.v
macros.v
me_cells.v
sc.v
meiko1.v

meiko_refined.v includes following files:
cells_ref.v
ff_primitives.v
macros_ref.v
me_cells.v
sc_ref.v
meiko1.v

meiko1.v includes files located in following folders of microSparcII:
fpu_ctl
fpu_exp
fpu_fpc
fpu_frac
fpu_rom

The extra multiplier contained in fpu_fpc is disabled, so the files in fpu_fpm and fpu_rf are not include!
The top entity is FPU located in fpu_fpc file. It should be extracted, and disabled the fpufpc top entity.

THERE IS ABSOLUTE NO WARRANTY !
