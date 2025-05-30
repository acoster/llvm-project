; NOTE: Assertions have been autogenerated by utils/update_test_checks.py UTC_ARGS: --version 5
; RUN: opt -S -passes=instcombine < %s 2>&1 | FileCheck %s

define <2 x i1> @pr98435(<2 x i1> %val) {
; CHECK-LABEL: define <2 x i1> @pr98435(
; CHECK-SAME: <2 x i1> [[VAL:%.*]]) {
; CHECK-NEXT:    [[VAL1:%.*]] = select <2 x i1> <i1 undef, i1 true>, <2 x i1> splat (i1 true), <2 x i1> [[VAL]]
; CHECK-NEXT:    ret <2 x i1> [[VAL1]]
;
  %val1 = select <2 x i1> <i1 undef, i1 true>, <2 x i1> <i1 true, i1 true>, <2 x i1> %val
  ret <2 x i1> %val1
}
