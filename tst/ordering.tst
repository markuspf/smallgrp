gap> START_TEST("ordering.tst");;

# First make sure we actually implement Bettina's
# permutations
gap> perm5  := [1];;
gap> Append(perm5, [ 30083, 30084, 30085, 30086 ]);;
gap> Append(perm5, [2..30082]);;
gap> PositionsProperty([1..Length(perm5)], i -> perm5[i] <> SMALL_GROUPS_PERM5(i));
[  ]

#
gap> perm7  := [1];;
gap> Append(perm7, [ 104599, 104600, 104601, 104602 ]);;
gap> Append(perm7, [2..104598]);;
gap> PositionsProperty([1..Length(perm7)], i -> perm7[i] <> SMALL_GROUPS_PERM7(i));
[  ]

#
gap> perm11 := [1];;
gap> Append(perm11, [ 721053, 721054, 721055, 721056 ]);;
gap> Append(perm11, [2..721053]);;
gap> PositionsProperty([1..Length(perm11)], i -> perm11[i] <> SMALL_GROUPS_PERM11(i));
[  ]

#
gap> TestSmallPerm := function(n, perm, list)
> local ord, res, old, new;
> ord := SMALL_GROUPS_OLD_ORDER;
> SMALL_GROUPS_OLD_ORDER := false;
> new := List(list, i -> CodePcGroup(SmallGroup(n, i)));;
> SMALL_GROUPS_OLD_ORDER := true;;
> old := List(List(list, perm), i -> CodePcGroup(SmallGroup(n, i)));;
> SMALL_GROUPS_OLD_ORDER := ord;
> return old = new;
> end;;

#
gap> TestSmallPerm(5^7, SMALL_GROUPS_PERM5, Union([1..100],[30083..30086]));
true
gap> TestSmallPerm(7^7, SMALL_GROUPS_PERM7, Union([1..100],[104599..104602]));
true
gap> TestSmallPerm(11^7, SMALL_GROUPS_PERM11, Union([1..100],[721053..721056]));
true

#
gap> STOP_TEST("ordering,tst");;
