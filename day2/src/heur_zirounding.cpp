#include <scip/pub_lp.h>
#include <scip/pub_var.h>
#include <scip/scip_branch.h>
#include <scip/scip_lp.h>
#include <scip/scip_numerics.h>
#include <scip/scip_solvingstats.h>
#include <scip/type_heur.h>
#include <scip/type_result.h>
#include <scip/type_retcode.h>
#include <scip/type_var.h>

#include <cmath>
#include <cstddef>
#include <memory>
#include <ranges>
#include <span>
#include <vector>

#include "heur_zirounding.hpp"
#include "utils.hpp"

static constexpr SCIP_Real min_shift =
    1e-4;  // Minimum change to the incumbent for a move to be considered
static constexpr SCIP_Real min_slack =
    1e-5;  // Minimum slack that a constraint should have before move can be
           // generated from it
static constexpr SCIP_Real max_iter = 1'000'000;

/* Do not change start */
struct SolDeleter{
  SCIP * scip;
  SolDeleter(SCIP * scip): scip(scip){};  
  void operator()(SCIP_Sol * p){ SCIPfreeSol(scip, &p);};
};
using SolPtr = std::unique_ptr<SCIP_SOL, SolDeleter>;
bool add_solution_helper(SCIP* scip, SCIP_HEUR* heur, std::span<SCIP_COL* const> lp_cols, std::span<SCIP_Real> incumbent){
    SolDeleter deleter(scip); 
    SolPtr sol(nullptr, deleter);
    CALL_CHECK(SCIPcreateSol(scip, std::out_ptr(sol), heur));
    for (auto [col, val] : std::ranges::zip_view(lp_cols, incumbent)) {
      CALL_CHECK(SCIPsetSolVal(scip, sol.get(), SCIPcolGetVar(col), val));
    }
    unsigned int stored;
    CALL_CHECK(SCIPtrySol(scip, sol.get(), FALSE, TRUE, TRUE, TRUE, TRUE, &stored));
    return stored;
}
/* Do not change end*/

bool is_any_fractional_remaining(SCIP* scip, std::span<SCIP_COL* const> lp_cols,
                                 std::span<SCIP_Real> incumbent) {
  // HINT use SCIPvarIsIntegral ad SCIPcolGetVar to check if any incumbent is
  // still fractional, use SCIPisFeasIntegral to check if value is within
  // integer tolerances
...
  return false;
}

SCIP_Real compute_incumbent_activity(SCIP_Row* row,
                                     std::span<SCIP_Real> incumbent) {
  // Compute incumbent activity for the current row
  // HINT create a coeff span using SCIProwGetVals, SCIProwGetNNonz and a cols
  // span using SCIProwGetCols, and SCIProwGetNNonz. Finally use SCIPcolGetLPPos
  // row activity = row constant + sum over nonzero coeff*value. The constant
  // term can be obtianed via SCIProwGetConstant
    ...
  return activity;
}

SCIP_DECL_HEUREXEC(ZIRoundHeur::scip_exec) {
  /* Dont touch start from here */
  *result = SCIP_DIDNOTRUN;
  assert(SCIPhasCurrentNodeLP(scip));
  assert(SCIPgetNLPs(scip) != nlpsolve);

  // Do not call heuristic if node was already detected to be infeasible
  if (nodeinfeasible) return SCIP_OKAY;

  // Only call heuristic if an optimal LP solution is at hand
  if (SCIPgetLPSolstat(scip) != SCIP_LPSOLSTAT_OPTIMAL) return SCIP_OKAY;

  // Only call heuristic if LP objective value is smaller than the cutoff bound
  if (SCIPisGE(scip, SCIPgetLPObjval(scip), SCIPgetCutoffbound(scip)))
    return SCIP_OKAY;

  // If LP Solution satisfy integrality constraint then skip the heuristic
  if (SCIPgetNLPBranchCands(scip) == 0) return SCIP_OKAY;

  // Make sure we are at a new LP solution before heuristic is called
  nlpsolve = SCIPgetNLPs(scip);

  *result = SCIP_DIDNOTFIND;
  /* Don't touch end here */

  /* Start editing from here onwards*/
  // Get LP informations, construct spans from SCIPgetLPRows, SCIPgetNLPRows,
  // SCIPgetLPCols, SCIPgetNLPCols
  std::span<SCIP_COL* const> lp_cols(SCIPgetLPCols(scip), SCIPgetNLPCols(scip));
  std::span<SCIP_Row* const> lp_rows(SCIPgetLPRows(scip), SCIPgetNLPRows(scip));

  // Read the incumbent LP solution from SCIP see SCIPcolGetPrimsol
  
  // Loop while there is any fractional variable remaining in the incumbent solution
  // and iter have not reached max iter
  while () {
     // check if var is fractional see is_fractional_remaining hint
      
      ...
     // compute how far up / down this variable can be rounded
    // start with var_ub and var_lb via SCIPcolGetUb/ SCIPcolGetLb
     ... 
    // for each row containing this variable, recompute the row's current
      // activity and see how it limits this variable's value
      // Hint use SCIPcolGetVals and SCIPcolGetNNonz to get the coefficient of
      // the columns on rows that are non zero and use SCIPcolGetRows to get the
      // rows for which the variable coefficients is nonzero
    ...


          // Loop over the rows update var_ub and var_lb 
      // Hint 1: during the for loop over the rows check if row is in LP using
      // if (!SCIProwIsInLP(row)) continue;
      // Hint 2: Use SCIProwGetLhs and SCIProwGetRhs to get left and right and
      // side remember to check if they are + or - infity using
      // SCIPisInfinity, note it applies if l is - SCIPinfinity(scip.get())
      // then SCIPisInifinity(-l) is true 
      // Hint 3: SCIP provide with MIN and MAX function
      // Determine update rule for var_ub and var_lb
     ...

      // check if the next integer up or down is reachable without breaking
      // anything use SCIPfeasCeil/Floor to get next integer up or down here, 
      // since we don't need to ceil if the value is solution is already near enough to integral
      // To do LE and GE with tolerances use SCIPisLE and SCIPisGE
      // To do LT and GT with tolerances use SCIPisLT and SCIPisGT
      ...

      // If var is up and down roundable pick objective improving direction
      // If var is only up or only down roundable pick roundable direction
      // If var is neither roundable determine whether staying, going to the upper bound,
      // going to the lower bound give the best fractionality reduction
      // Tie can be broken by selecting the objective improving direction
      ...


      // Check if we find any shift
      ...

      // Increment iter_count and check if it is less than max_iter
      ...

  }

  // Add Sol if any is found
  // Use 
  // bool stored = add_solution_helper(scip, heur, lp_cols, incumbent);
  // if(stored) *result = SCIP_FOUNDSOL;
  if (...) {
    bool stored = add_solution_helper(scip, heur, lp_cols, incumbent);
    if (stored) {
      *result = SCIP_FOUNDSOL;
    }
  }

  return SCIP_OKAY;
}
