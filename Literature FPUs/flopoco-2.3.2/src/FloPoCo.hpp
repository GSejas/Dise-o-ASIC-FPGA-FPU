#ifndef FLOPOCO_HPP
#define FLOPOCO_HPP
// TODO: I guess we should at some point copy here only the public part of each class, 
// to provide a single self-contained include file.

#include "Operator.hpp"
#include "FlopocoStream.hpp"


#include "Target.hpp"
#include "Targets/DSP.hpp"
#include "Targets/Spartan3.hpp"
#include "Targets/Virtex4.hpp"
#include "Targets/Virtex5.hpp"
#include "Targets/Virtex6.hpp"
#include "Targets/StratixII.hpp"
#include "Targets/StratixIII.hpp"
#include "Targets/StratixIV.hpp"

/* shifters + lzoc ------------------------------------------- */
#include "Shifters.hpp"
#include "LZOC.hpp"
#include "LZOCShifterSticky.hpp"

/* regular pipelined integer adder/ adder+subtracter --------- */
#include "IntAdder.hpp"
#include "IntDualSub.hpp"

/* multioperand adders --------------------------------------- */
#include "IntMultiAdder.hpp"
#include "IntAddition/IntNAdder.hpp"
#include "IntAddition/IntCompressorTree.hpp"

/* comparator(s) --------------------------------------------- */
#include "IntComparator.hpp"

/* fast adders ----------------------------------------------- */
#include "IntAddition/LongIntAdderAddAddMuxGen1.hpp"
#include "IntAddition/LongIntAdderCmpCmpAddGen1.hpp"
#include "IntAddition/LongIntAdderCmpAddIncGen1.hpp"

#include "IntAddition/IntAdderSpecific.hpp"
#include "IntAddition/CarryGenerationCircuit.hpp"
#include "IntAddition/LongIntAdderAddAddMuxGen2.hpp"
#include "IntAddition/LongIntAdderCmpCmpAddGen2.hpp"
#include "IntAddition/LongIntAdderCmpAddIncGen2.hpp"
#include "IntAddition/IntComparatorSpecific.hpp"

#include "IntAddition/LongIntAdderMuxNetwork.hpp"


/* multiplication-related ------------------------------------ */
#include "IntMultiplier.hpp"
#include "IntMultipliers/IntTilingMult.hpp"
#include "IntMultipliers/SignedIntMultiplier.hpp"
#include "IntMultipliers/UnsignedIntMultiplier.hpp"
#include "IntMultipliers/IntTruncMultiplier.hpp"
#include "IntMultipliers/IntKaratsuba.hpp"
#include "IntSquarer.hpp"

#include "ConstMult/IntConstMult.hpp"
#include "ConstMult/FPConstMult.hpp"
#include "ConstMult/IntIntKCM.hpp"
#include "ConstMult/FixRealKCM.hpp"

#include "IntConstDiv.hpp"
#include "FPConstDiv.hpp"


/* fixed-point function evaluation---------------------------- */
#ifndef _WIN32

#ifdef HAVE_SOLLYA
#include "FixedPointFunctions/HOTBM.hpp"
#include "FixedPointFunctions/FunctionTable.hpp"
#include "FixedPointFunctions/PolyCoeffTable.hpp"
#include "FixedPointFunctions/FunctionEvaluator.hpp"
#include "FixedPointFunctions/PolynomialEvaluator.hpp"
#endif
#endif

/* floating-point -------------------------------------------- */ 
#include "FPMultiplier.hpp"
#include "FPMultiplierKaratsuba.hpp"
#include "FPSquarer.hpp"

#ifndef _WIN32
#ifdef HAVE_SOLLYA
#include "ConstMult/CRFPConstMult.hpp"
#endif
#endif

#include "FPAdderDualPath.hpp"
#include "FPAdderSinglePath.hpp"
#include "FPAdder3Input.hpp"

#include "FPDiv.hpp"
#include "FPExp.hpp" 
#include "FPLog.hpp"
#include "FPPow.hpp"

#include "FPSqrt.hpp"
#include "FPSqrtPoly.hpp"

#include "LongAcc.hpp"
#include "LongAcc2FP.hpp"

#include "DotProduct.hpp"
#include "FPSumOfSquares.hpp"

#include "FPPipeline.hpp"

#include "Fix2FP.hpp"
#include "InputIEEE.hpp"
#include "OutputIEEE.hpp"


/* test-bench related ---------------------------------------- */
#include "TestBench.hpp"


/* applications ---------------------------------------------- */

/* Coil Inductance application */
//#include "apps/CoilInductance/CoordinatesTableX.hpp"
//#include "apps/CoilInductance/CoordinatesTableZ.hpp"
//#include "apps/CoilInductance/CoordinatesTableY.hpp"
//#include "apps/CoilInductance/CoilInductance.hpp"

/* fast evaluation of the possible intrusion of a point within a 
spheric enclosure -------------------------------------------- */ 
#include "apps/Collision.hpp"

/* a floating-point fused multiply-accumulate operator for the 
use withing matrix-multiplication scenarios ------------------ */ 
#include "apps/FPFMAcc.hpp"

/* a 1D Jacobi computation kernel ---------------------------- */ 
#include "apps/FPJacobi.hpp"

/* logarithmic number system  -------------------------------- */ 
#ifndef _WIN32
#ifdef HAVE_LNS
#include "LNS/LNSAddSub.hpp"
#include "LNS/LNSAdd.hpp"
#include "LNS/CotranTables.hpp"
#include "LNS/Cotran.hpp"
#include "LNS/CotranHybrid.hpp"
#include "LNS/LNSMul.hpp"
#include "LNS/LNSDiv.hpp"
#include "LNS/LNSSqrt.hpp"
#include "LNS/AtanPow.hpp"
#include "LNS/LogSinCos.hpp"
#endif
#endif

/* misc ------------------------------------------------------ */
#include "Wrapper.hpp"
#include "UserDefinedOperator.hpp"


#endif //FLOPOCO_HPP
