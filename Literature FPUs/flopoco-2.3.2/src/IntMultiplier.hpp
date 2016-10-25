#ifndef IntMultiplierS_HPP
#define IntMultiplierS_HPP
#include <vector>
#include <sstream>
#include <gmp.h>
#include <gmpxx.h>
#include "utils.hpp"
#include "Operator.hpp"

namespace flopoco {


/** The IntMultiplier class for experimenting with adders.
*/
class IntMultiplier : public Operator {
public:
    /**
    * The IntMultiplier constructor
    * @param[in] target           the target device
    **/
    IntMultiplier(Target* target, int wInX, int wInY, map<string, double> inputDelays = emptyDelayMap, bool sign = false, float ratio = 1.0);

    /**
    *  Destructor
    */
    ~IntMultiplier();

    void outputVHDL(std::ostream& o, std::string name);

    void changeName(std::string operatorName);

    /**
    * The emulate function.
    * @param[in] tc               a list of test-cases
    */
    void emulate ( TestCase* tc );

protected:
    int wInX_;                         /**< the width for X*/
    int wInY_;                         /**< the width for Y*/
    int wOut_;
    int sign_;
    float ratio_;

private:
    vector<Operator*> multiplierImplementationList;
    int selectedVersion;
    Operator* IntMultiplierInstantiation;
};

}
#endif
