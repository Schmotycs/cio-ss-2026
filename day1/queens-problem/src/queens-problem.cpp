#include <format>
#include <iostream>
#include <memory>
#include <objscip/objscip.h>
#include <objscip/objscipdefplugins.h>
#include <print>
#include <vector>

#include "utils.hpp"

constexpr int chessboard_size = 8;
constexpr int idx(int row, int col) {
    return row * chessboard_size + col;
};

struct SCIPDeleter{
    void operator()(SCIP* scip) const{
        SCIPfree(&scip);
    }
};
using SCIPPtr = std::unique_ptr<SCIP, SCIPDeleter>;

struct VarDeleter{
    SCIP* scip;
    VarDeleter(SCIP* scip): scip(scip){}
    void operator()(SCIP_VAR* var) const{
        SCIPreleaseVar(scip, &var);
    }
};
using VarPtr = std::unique_ptr<SCIP_VAR, VarDeleter>;

struct ConstDeleter{
    SCIP* scip;
    ConstDeleter(SCIP* scip): scip(scip){}
    void operator()(SCIP_CONS* cons) const{
        SCIPreleaseCons(scip, &cons);
    }
};
using ConstPtr = std::unique_ptr<SCIP_CONS, ConstDeleter>;


void add_no_good(SCIP* scip, std::vector<SCIP_Real>& sol_values,  std::vector<VarPtr>& vars, int solution_number) {
    ConstDeleter constDeleter(scip);
    ConstPtr cons(nullptr, constDeleter);
    CALL_CHECK(SCIPcreateConsBasicLinear(scip, std::out_ptr(cons), std::format("no_good_{}", solution_number).c_str(), 0, nullptr, nullptr, -SCIPinfinity(scip), chessboard_size-1));
    for (int i = 0; i < chessboard_size; ++i) {
        for (int j = 0; j < chessboard_size; ++j) {
            if (sol_values[idx(i, j)] > 0.5) {
                CALL_CHECK(SCIPaddCoefLinear(scip, cons.get(), vars[idx(i, j)].get(), 1.0));
            }
        }
    }
    CALL_CHECK(SCIPaddCons(scip, cons.get()));
}

int main(){
    SCIPPtr scip;
    CALL_CHECK(SCIPcreate(std::out_ptr(scip)));
    CALL_CHECK(SCIPincludeDefaultPlugins(scip.get()));
    CALL_CHECK(SCIPcreateProbBasic(scip.get(), "ExampleMIP"));
    const SCIP_Real inf = SCIPinfinity(scip.get());

    
    
}