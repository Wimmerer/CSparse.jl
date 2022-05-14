struct cs_di_sparse
    nzmax::Cint
    m::Cint
    n::Cint
    p::Ptr{Cint}
    i::Ptr{Cint}
    x::Ptr{Cdouble}
    nz::Cint
end

const cs_di = cs_di_sparse

mutable struct SuiteSparse_config_struct
    malloc_func::Ptr{Cvoid}
    calloc_func::Ptr{Cvoid}
    realloc_func::Ptr{Cvoid}
    free_func::Ptr{Cvoid}
    printf_func::Ptr{Cvoid}
    hypot_func::Ptr{Cvoid}
    divcomplex_func::Ptr{Cvoid}
    SuiteSparse_config_struct() = new()
end

function SuiteSparse_start()
    @ccall libcholmod.SuiteSparse_start()::Cvoid
end

function SuiteSparse_finish()
    @ccall libcholmod.SuiteSparse_finish()::Cvoid
end

function SuiteSparse_malloc(nitems, size_of_item)
    @ccall libcholmod.SuiteSparse_malloc(nitems::Csize_t, size_of_item::Csize_t)::Ptr{Cvoid}
end

function SuiteSparse_calloc(nitems, size_of_item)
    @ccall libcholmod.SuiteSparse_calloc(nitems::Csize_t, size_of_item::Csize_t)::Ptr{Cvoid}
end

function SuiteSparse_realloc(nitems_new, nitems_old, size_of_item, p, ok)
    @ccall libcholmod.SuiteSparse_realloc(nitems_new::Csize_t, nitems_old::Csize_t, size_of_item::Csize_t, p::Ptr{Cvoid}, ok::Ptr{Cint})::Ptr{Cvoid}
end

function SuiteSparse_free(p)
    @ccall libcholmod.SuiteSparse_free(p::Ptr{Cvoid})::Ptr{Cvoid}
end

function SuiteSparse_tic(tic)
    @ccall libcholmod.SuiteSparse_tic(tic::Ptr{Cdouble})::Cvoid
end

function SuiteSparse_toc(tic)
    @ccall libcholmod.SuiteSparse_toc(tic::Ptr{Cdouble})::Cdouble
end

function SuiteSparse_time()
    @ccall libcholmod.SuiteSparse_time()::Cdouble
end

function SuiteSparse_hypot(x, y)
    @ccall libcholmod.SuiteSparse_hypot(x::Cdouble, y::Cdouble)::Cdouble
end

function SuiteSparse_divcomplex(ar, ai, br, bi, cr, ci)
    @ccall libcholmod.SuiteSparse_divcomplex(ar::Cdouble, ai::Cdouble, br::Cdouble, bi::Cdouble, cr::Ptr{Cdouble}, ci::Ptr{Cdouble})::Cint
end

function SuiteSparse_version(version)
    @ccall libcholmod.SuiteSparse_version(version::Ptr{Cint})::Cint
end

function cs_di_add(A, B, alpha, beta)
    @ccall libcxsparse.cs_di_add(A::Ptr{cs_di}, B::Ptr{cs_di}, alpha::Cdouble, beta::Cdouble)::Ptr{cs_di}
end

function cs_di_cholsol(order, A, b)
    @ccall libcxsparse.cs_di_cholsol(order::Cint, A::Ptr{cs_di}, b::Ptr{Cdouble})::Cint
end

function cs_di_dupl(A)
    @ccall libcxsparse.cs_di_dupl(A::Ptr{cs_di})::Cint
end

function cs_di_entry(T, i, j, x)
    @ccall libcxsparse.cs_di_entry(T::Ptr{cs_di}, i::Cint, j::Cint, x::Cdouble)::Cint
end

function cs_di_lusol(order, A, b, tol)
    @ccall libcxsparse.cs_di_lusol(order::Cint, A::Ptr{cs_di}, b::Ptr{Cdouble}, tol::Cdouble)::Cint
end

function cs_di_gaxpy(A, x, y)
    @ccall libcxsparse.cs_di_gaxpy(A::Ptr{cs_di}, x::Ptr{Cdouble}, y::Ptr{Cdouble})::Cint
end

function cs_di_multiply(A, B)
    @ccall libcxsparse.cs_di_multiply(A::Ptr{cs_di}, B::Ptr{cs_di})::Ptr{cs_di}
end

function cs_di_qrsol(order, A, b)
    @ccall libcxsparse.cs_di_qrsol(order::Cint, A::Ptr{cs_di}, b::Ptr{Cdouble})::Cint
end

function cs_di_transpose(A, values)
    @ccall libcxsparse.cs_di_transpose(A::Ptr{cs_di}, values::Cint)::Ptr{cs_di}
end

function cs_di_compress(T)
    @ccall libcxsparse.cs_di_compress(T::Ptr{cs_di})::Ptr{cs_di}
end

function cs_di_norm(A)
    @ccall libcxsparse.cs_di_norm(A::Ptr{cs_di})::Cdouble
end

function cs_di_print(A, brief)
    @ccall libcxsparse.cs_di_print(A::Ptr{cs_di}, brief::Cint)::Cint
end

function cs_di_load(f)
    @ccall libcxsparse.cs_di_load(f::Ptr{Libc.FILE})::Ptr{cs_di}
end

function cs_di_calloc(n, size)
    @ccall libcxsparse.cs_di_calloc(n::Cint, size::Csize_t)::Ptr{Cvoid}
end

function cs_di_free(p)
    @ccall libcxsparse.cs_di_free(p::Ptr{Cvoid})::Ptr{Cvoid}
end

function cs_di_realloc(p, n, size, ok)
    @ccall libcxsparse.cs_di_realloc(p::Ptr{Cvoid}, n::Cint, size::Csize_t, ok::Ptr{Cint})::Ptr{Cvoid}
end

function cs_di_spalloc(m, n, nzmax, values, t)
    @ccall libcxsparse.cs_di_spalloc(m::Cint, n::Cint, nzmax::Cint, values::Cint, t::Cint)::Ptr{cs_di}
end

function cs_di_spfree(A)
    @ccall libcxsparse.cs_di_spfree(A::Ptr{cs_di})::Ptr{cs_di}
end

function cs_di_sprealloc(A, nzmax)
    @ccall libcxsparse.cs_di_sprealloc(A::Ptr{cs_di}, nzmax::Cint)::Cint
end

function cs_di_malloc(n, size)
    @ccall libcxsparse.cs_di_malloc(n::Cint, size::Csize_t)::Ptr{Cvoid}
end

mutable struct cs_di_symbolic
    pinv::Ptr{Cint}
    q::Ptr{Cint}
    parent::Ptr{Cint}
    cp::Ptr{Cint}
    leftmost::Ptr{Cint}
    m2::Cint
    lnz::Cdouble
    unz::Cdouble
    cs_di_symbolic() = new()
end

const cs_dis = cs_di_symbolic

mutable struct cs_di_numeric
    L::Ptr{cs_di}
    U::Ptr{cs_di}
    pinv::Ptr{Cint}
    B::Ptr{Cdouble}
    cs_di_numeric() = new()
end

const cs_din = cs_di_numeric

mutable struct cs_di_dmperm_results
    p::Ptr{Cint}
    q::Ptr{Cint}
    r::Ptr{Cint}
    s::Ptr{Cint}
    nb::Cint
    rr::NTuple{5, Cint}
    cc::NTuple{5, Cint}
    cs_di_dmperm_results() = new()
end

const cs_did = cs_di_dmperm_results

function cs_di_amd(order, A)
    @ccall libcxsparse.cs_di_amd(order::Cint, A::Ptr{cs_di})::Ptr{Cint}
end

function cs_di_chol(A, S)
    @ccall libcxsparse.cs_di_chol(A::Ptr{cs_di}, S::Ptr{cs_dis})::Ptr{cs_din}
end

function cs_di_dmperm(A, seed)
    @ccall libcxsparse.cs_di_dmperm(A::Ptr{cs_di}, seed::Cint)::Ptr{cs_did}
end

function cs_di_droptol(A, tol)
    @ccall libcxsparse.cs_di_droptol(A::Ptr{cs_di}, tol::Cdouble)::Cint
end

function cs_di_dropzeros(A)
    @ccall libcxsparse.cs_di_dropzeros(A::Ptr{cs_di})::Cint
end

function cs_di_happly(V, i, beta, x)
    @ccall libcxsparse.cs_di_happly(V::Ptr{cs_di}, i::Cint, beta::Cdouble, x::Ptr{Cdouble})::Cint
end

function cs_di_ipvec(p, b, x, n)
    @ccall libcxsparse.cs_di_ipvec(p::Ptr{Cint}, b::Ptr{Cdouble}, x::Ptr{Cdouble}, n::Cint)::Cint
end

function cs_di_lsolve(L, x)
    @ccall libcxsparse.cs_di_lsolve(L::Ptr{cs_di}, x::Ptr{Cdouble})::Cint
end

function cs_di_ltsolve(L, x)
    @ccall libcxsparse.cs_di_ltsolve(L::Ptr{cs_di}, x::Ptr{Cdouble})::Cint
end

function cs_di_lu(A, S, tol)
    @ccall libcxsparse.cs_di_lu(A::Ptr{cs_di}, S::Ptr{cs_dis}, tol::Cdouble)::Ptr{cs_din}
end

function cs_di_permute(A, pinv, q, values)
    @ccall libcxsparse.cs_di_permute(A::Ptr{cs_di}, pinv::Ptr{Cint}, q::Ptr{Cint}, values::Cint)::Ptr{cs_di}
end

function cs_di_pinv(p, n)
    @ccall libcxsparse.cs_di_pinv(p::Ptr{Cint}, n::Cint)::Ptr{Cint}
end

function cs_di_pvec(p, b, x, n)
    @ccall libcxsparse.cs_di_pvec(p::Ptr{Cint}, b::Ptr{Cdouble}, x::Ptr{Cdouble}, n::Cint)::Cint
end

function cs_di_qr(A, S)
    @ccall libcxsparse.cs_di_qr(A::Ptr{cs_di}, S::Ptr{cs_dis})::Ptr{cs_din}
end

function cs_di_schol(order, A)
    @ccall libcxsparse.cs_di_schol(order::Cint, A::Ptr{cs_di})::Ptr{cs_dis}
end

function cs_di_sqr(order, A, qr)
    @ccall libcxsparse.cs_di_sqr(order::Cint, A::Ptr{cs_di}, qr::Cint)::Ptr{cs_dis}
end

function cs_di_symperm(A, pinv, values)
    @ccall libcxsparse.cs_di_symperm(A::Ptr{cs_di}, pinv::Ptr{Cint}, values::Cint)::Ptr{cs_di}
end

function cs_di_usolve(U, x)
    @ccall libcxsparse.cs_di_usolve(U::Ptr{cs_di}, x::Ptr{Cdouble})::Cint
end

function cs_di_utsolve(U, x)
    @ccall libcxsparse.cs_di_utsolve(U::Ptr{cs_di}, x::Ptr{Cdouble})::Cint
end

function cs_di_updown(L, sigma, C, parent)
    @ccall libcxsparse.cs_di_updown(L::Ptr{cs_di}, sigma::Cint, C::Ptr{cs_di}, parent::Ptr{Cint})::Cint
end

function cs_di_sfree(S)
    @ccall libcxsparse.cs_di_sfree(S::Ptr{cs_dis})::Ptr{cs_dis}
end

function cs_di_nfree(N)
    @ccall libcxsparse.cs_di_nfree(N::Ptr{cs_din})::Ptr{cs_din}
end

function cs_di_dfree(D)
    @ccall libcxsparse.cs_di_dfree(D::Ptr{cs_did})::Ptr{cs_did}
end

function cs_di_counts(A, parent, post, ata)
    @ccall libcxsparse.cs_di_counts(A::Ptr{cs_di}, parent::Ptr{Cint}, post::Ptr{Cint}, ata::Cint)::Ptr{Cint}
end

function cs_di_cumsum(p, c, n)
    @ccall libcxsparse.cs_di_cumsum(p::Ptr{Cint}, c::Ptr{Cint}, n::Cint)::Cdouble
end

function cs_di_dfs(j, G, top, xi, pstack, pinv)
    @ccall libcxsparse.cs_di_dfs(j::Cint, G::Ptr{cs_di}, top::Cint, xi::Ptr{Cint}, pstack::Ptr{Cint}, pinv::Ptr{Cint})::Cint
end

function cs_di_etree(A, ata)
    @ccall libcxsparse.cs_di_etree(A::Ptr{cs_di}, ata::Cint)::Ptr{Cint}
end

function cs_di_fkeep(A, fkeep, other)
    @ccall libcxsparse.cs_di_fkeep(A::Ptr{cs_di}, fkeep::Ptr{Cvoid}, other::Ptr{Cvoid})::Cint
end

function cs_di_house(x, beta, n)
    @ccall libcxsparse.cs_di_house(x::Ptr{Cdouble}, beta::Ptr{Cdouble}, n::Cint)::Cdouble
end

function cs_di_maxtrans(A, seed)
    @ccall libcxsparse.cs_di_maxtrans(A::Ptr{cs_di}, seed::Cint)::Ptr{Cint}
end

function cs_di_post(parent, n)
    @ccall libcxsparse.cs_di_post(parent::Ptr{Cint}, n::Cint)::Ptr{Cint}
end

function cs_di_scc(A)
    @ccall libcxsparse.cs_di_scc(A::Ptr{cs_di})::Ptr{cs_did}
end

function cs_di_scatter(A, j, beta, w, x, mark, C, nz)
    @ccall libcxsparse.cs_di_scatter(A::Ptr{cs_di}, j::Cint, beta::Cdouble, w::Ptr{Cint}, x::Ptr{Cdouble}, mark::Cint, C::Ptr{cs_di}, nz::Cint)::Cint
end

function cs_di_tdfs(j, k, head, next, post, stack)
    @ccall libcxsparse.cs_di_tdfs(j::Cint, k::Cint, head::Ptr{Cint}, next::Ptr{Cint}, post::Ptr{Cint}, stack::Ptr{Cint})::Cint
end

function cs_di_leaf(i, j, first, maxfirst, prevleaf, ancestor, jleaf)
    @ccall libcxsparse.cs_di_leaf(i::Cint, j::Cint, first::Ptr{Cint}, maxfirst::Ptr{Cint}, prevleaf::Ptr{Cint}, ancestor::Ptr{Cint}, jleaf::Ptr{Cint})::Cint
end

function cs_di_reach(G, B, k, xi, pinv)
    @ccall libcxsparse.cs_di_reach(G::Ptr{cs_di}, B::Ptr{cs_di}, k::Cint, xi::Ptr{Cint}, pinv::Ptr{Cint})::Cint
end

function cs_di_spsolve(L, B, k, xi, x, pinv, lo)
    @ccall libcxsparse.cs_di_spsolve(L::Ptr{cs_di}, B::Ptr{cs_di}, k::Cint, xi::Ptr{Cint}, x::Ptr{Cdouble}, pinv::Ptr{Cint}, lo::Cint)::Cint
end

function cs_di_ereach(A, k, parent, s, w)
    @ccall libcxsparse.cs_di_ereach(A::Ptr{cs_di}, k::Cint, parent::Ptr{Cint}, s::Ptr{Cint}, w::Ptr{Cint})::Cint
end

function cs_di_randperm(n, seed)
    @ccall libcxsparse.cs_di_randperm(n::Cint, seed::Cint)::Ptr{Cint}
end

function cs_di_dalloc(m, n)
    @ccall libcxsparse.cs_di_dalloc(m::Cint, n::Cint)::Ptr{cs_did}
end

function cs_di_done(C, w, x, ok)
    @ccall libcxsparse.cs_di_done(C::Ptr{cs_di}, w::Ptr{Cvoid}, x::Ptr{Cvoid}, ok::Cint)::Ptr{cs_di}
end

function cs_di_idone(p, C, w, ok)
    @ccall libcxsparse.cs_di_idone(p::Ptr{Cint}, C::Ptr{cs_di}, w::Ptr{Cvoid}, ok::Cint)::Ptr{Cint}
end

function cs_di_ndone(N, C, w, x, ok)
    @ccall libcxsparse.cs_di_ndone(N::Ptr{cs_din}, C::Ptr{cs_di}, w::Ptr{Cvoid}, x::Ptr{Cvoid}, ok::Cint)::Ptr{cs_din}
end

function cs_di_ddone(D, C, w, ok)
    @ccall libcxsparse.cs_di_ddone(D::Ptr{cs_did}, C::Ptr{cs_di}, w::Ptr{Cvoid}, ok::Cint)::Ptr{cs_did}
end

struct cs_dl_sparse
    nzmax::Clong
    m::Clong
    n::Clong
    p::Ptr{Clong}
    i::Ptr{Clong}
    x::Ptr{Cdouble}
    nz::Clong
end

const cs_dl = cs_dl_sparse

function cs_dl_add(A, B, alpha, beta)
    @ccall libcxsparse.cs_dl_add(A::Ptr{cs_dl}, B::Ptr{cs_dl}, alpha::Cdouble, beta::Cdouble)::Ptr{cs_dl}
end

function cs_dl_cholsol(order, A, b)
    @ccall libcxsparse.cs_dl_cholsol(order::Clong, A::Ptr{cs_dl}, b::Ptr{Cdouble})::Clong
end

function cs_dl_dupl(A)
    @ccall libcxsparse.cs_dl_dupl(A::Ptr{cs_dl})::Clong
end

function cs_dl_entry(T, i, j, x)
    @ccall libcxsparse.cs_dl_entry(T::Ptr{cs_dl}, i::Clong, j::Clong, x::Cdouble)::Clong
end

function cs_dl_lusol(order, A, b, tol)
    @ccall libcxsparse.cs_dl_lusol(order::Clong, A::Ptr{cs_dl}, b::Ptr{Cdouble}, tol::Cdouble)::Clong
end

function cs_dl_gaxpy(A, x, y)
    @ccall libcxsparse.cs_dl_gaxpy(A::Ptr{cs_dl}, x::Ptr{Cdouble}, y::Ptr{Cdouble})::Clong
end

function cs_dl_multiply(A, B)
    @ccall libcxsparse.cs_dl_multiply(A::Ptr{cs_dl}, B::Ptr{cs_dl})::Ptr{cs_dl}
end

function cs_dl_qrsol(order, A, b)
    @ccall libcxsparse.cs_dl_qrsol(order::Clong, A::Ptr{cs_dl}, b::Ptr{Cdouble})::Clong
end

function cs_dl_transpose(A, values)
    @ccall libcxsparse.cs_dl_transpose(A::Ptr{cs_dl}, values::Clong)::Ptr{cs_dl}
end

function cs_dl_compress(T)
    @ccall libcxsparse.cs_dl_compress(T::Ptr{cs_dl})::Ptr{cs_dl}
end

function cs_dl_norm(A)
    @ccall libcxsparse.cs_dl_norm(A::Ptr{cs_dl})::Cdouble
end

function cs_dl_print(A, brief)
    @ccall libcxsparse.cs_dl_print(A::Ptr{cs_dl}, brief::Clong)::Clong
end

function cs_dl_load(f)
    @ccall libcxsparse.cs_dl_load(f::Ptr{Libc.FILE})::Ptr{cs_dl}
end

function cs_dl_calloc(n, size)
    @ccall libcxsparse.cs_dl_calloc(n::Clong, size::Csize_t)::Ptr{Cvoid}
end

function cs_dl_free(p)
    @ccall libcxsparse.cs_dl_free(p::Ptr{Cvoid})::Ptr{Cvoid}
end

function cs_dl_realloc(p, n, size, ok)
    @ccall libcxsparse.cs_dl_realloc(p::Ptr{Cvoid}, n::Clong, size::Csize_t, ok::Ptr{Clong})::Ptr{Cvoid}
end

function cs_dl_spalloc(m, n, nzmax, values, t)
    @ccall libcxsparse.cs_dl_spalloc(m::Clong, n::Clong, nzmax::Clong, values::Clong, t::Clong)::Ptr{cs_dl}
end

function cs_dl_spfree(A)
    @ccall libcxsparse.cs_dl_spfree(A::Ptr{cs_dl})::Ptr{cs_dl}
end

function cs_dl_sprealloc(A, nzmax)
    @ccall libcxsparse.cs_dl_sprealloc(A::Ptr{cs_dl}, nzmax::Clong)::Clong
end

function cs_dl_malloc(n, size)
    @ccall libcxsparse.cs_dl_malloc(n::Clong, size::Csize_t)::Ptr{Cvoid}
end

mutable struct cs_dl_symbolic
    pinv::Ptr{Clong}
    q::Ptr{Clong}
    parent::Ptr{Clong}
    cp::Ptr{Clong}
    leftmost::Ptr{Clong}
    m2::Clong
    lnz::Cdouble
    unz::Cdouble
    cs_dl_symbolic() = new()
end

const cs_dls = cs_dl_symbolic

mutable struct cs_dl_numeric
    L::Ptr{cs_dl}
    U::Ptr{cs_dl}
    pinv::Ptr{Clong}
    B::Ptr{Cdouble}
    cs_dl_numeric() = new()
end

const cs_dln = cs_dl_numeric

mutable struct cs_dl_dmperm_results
    p::Ptr{Clong}
    q::Ptr{Clong}
    r::Ptr{Clong}
    s::Ptr{Clong}
    nb::Clong
    rr::NTuple{5, Clong}
    cc::NTuple{5, Clong}
    cs_dl_dmperm_results() = new()
end

const cs_dld = cs_dl_dmperm_results

function cs_dl_amd(order, A)
    @ccall libcxsparse.cs_dl_amd(order::Clong, A::Ptr{cs_dl})::Ptr{Clong}
end

function cs_dl_chol(A, S)
    @ccall libcxsparse.cs_dl_chol(A::Ptr{cs_dl}, S::Ptr{cs_dls})::Ptr{cs_dln}
end

function cs_dl_dmperm(A, seed)
    @ccall libcxsparse.cs_dl_dmperm(A::Ptr{cs_dl}, seed::Clong)::Ptr{cs_dld}
end

function cs_dl_droptol(A, tol)
    @ccall libcxsparse.cs_dl_droptol(A::Ptr{cs_dl}, tol::Cdouble)::Clong
end

function cs_dl_dropzeros(A)
    @ccall libcxsparse.cs_dl_dropzeros(A::Ptr{cs_dl})::Clong
end

function cs_dl_happly(V, i, beta, x)
    @ccall libcxsparse.cs_dl_happly(V::Ptr{cs_dl}, i::Clong, beta::Cdouble, x::Ptr{Cdouble})::Clong
end

function cs_dl_ipvec(p, b, x, n)
    @ccall libcxsparse.cs_dl_ipvec(p::Ptr{Clong}, b::Ptr{Cdouble}, x::Ptr{Cdouble}, n::Clong)::Clong
end

function cs_dl_lsolve(L, x)
    @ccall libcxsparse.cs_dl_lsolve(L::Ptr{cs_dl}, x::Ptr{Cdouble})::Clong
end

function cs_dl_ltsolve(L, x)
    @ccall libcxsparse.cs_dl_ltsolve(L::Ptr{cs_dl}, x::Ptr{Cdouble})::Clong
end

function cs_dl_lu(A, S, tol)
    @ccall libcxsparse.cs_dl_lu(A::Ptr{cs_dl}, S::Ptr{cs_dls}, tol::Cdouble)::Ptr{cs_dln}
end

function cs_dl_permute(A, pinv, q, values)
    @ccall libcxsparse.cs_dl_permute(A::Ptr{cs_dl}, pinv::Ptr{Clong}, q::Ptr{Clong}, values::Clong)::Ptr{cs_dl}
end

function cs_dl_pinv(p, n)
    @ccall libcxsparse.cs_dl_pinv(p::Ptr{Clong}, n::Clong)::Ptr{Clong}
end

function cs_dl_pvec(p, b, x, n)
    @ccall libcxsparse.cs_dl_pvec(p::Ptr{Clong}, b::Ptr{Cdouble}, x::Ptr{Cdouble}, n::Clong)::Clong
end

function cs_dl_qr(A, S)
    @ccall libcxsparse.cs_dl_qr(A::Ptr{cs_dl}, S::Ptr{cs_dls})::Ptr{cs_dln}
end

function cs_dl_schol(order, A)
    @ccall libcxsparse.cs_dl_schol(order::Clong, A::Ptr{cs_dl})::Ptr{cs_dls}
end

function cs_dl_sqr(order, A, qr)
    @ccall libcxsparse.cs_dl_sqr(order::Clong, A::Ptr{cs_dl}, qr::Clong)::Ptr{cs_dls}
end

function cs_dl_symperm(A, pinv, values)
    @ccall libcxsparse.cs_dl_symperm(A::Ptr{cs_dl}, pinv::Ptr{Clong}, values::Clong)::Ptr{cs_dl}
end

function cs_dl_usolve(U, x)
    @ccall libcxsparse.cs_dl_usolve(U::Ptr{cs_dl}, x::Ptr{Cdouble})::Clong
end

function cs_dl_utsolve(U, x)
    @ccall libcxsparse.cs_dl_utsolve(U::Ptr{cs_dl}, x::Ptr{Cdouble})::Clong
end

function cs_dl_updown(L, sigma, C, parent)
    @ccall libcxsparse.cs_dl_updown(L::Ptr{cs_dl}, sigma::Clong, C::Ptr{cs_dl}, parent::Ptr{Clong})::Clong
end

function cs_dl_sfree(S)
    @ccall libcxsparse.cs_dl_sfree(S::Ptr{cs_dls})::Ptr{cs_dls}
end

function cs_dl_nfree(N)
    @ccall libcxsparse.cs_dl_nfree(N::Ptr{cs_dln})::Ptr{cs_dln}
end

function cs_dl_dfree(D)
    @ccall libcxsparse.cs_dl_dfree(D::Ptr{cs_dld})::Ptr{cs_dld}
end

function cs_dl_counts(A, parent, post, ata)
    @ccall libcxsparse.cs_dl_counts(A::Ptr{cs_dl}, parent::Ptr{Clong}, post::Ptr{Clong}, ata::Clong)::Ptr{Clong}
end

function cs_dl_cumsum(p, c, n)
    @ccall libcxsparse.cs_dl_cumsum(p::Ptr{Clong}, c::Ptr{Clong}, n::Clong)::Cdouble
end

function cs_dl_dfs(j, G, top, xi, pstack, pinv)
    @ccall libcxsparse.cs_dl_dfs(j::Clong, G::Ptr{cs_dl}, top::Clong, xi::Ptr{Clong}, pstack::Ptr{Clong}, pinv::Ptr{Clong})::Clong
end

function cs_dl_etree(A, ata)
    @ccall libcxsparse.cs_dl_etree(A::Ptr{cs_dl}, ata::Clong)::Ptr{Clong}
end

function cs_dl_fkeep(A, fkeep, other)
    @ccall libcxsparse.cs_dl_fkeep(A::Ptr{cs_dl}, fkeep::Ptr{Cvoid}, other::Ptr{Cvoid})::Clong
end

function cs_dl_house(x, beta, n)
    @ccall libcxsparse.cs_dl_house(x::Ptr{Cdouble}, beta::Ptr{Cdouble}, n::Clong)::Cdouble
end

function cs_dl_maxtrans(A, seed)
    @ccall libcxsparse.cs_dl_maxtrans(A::Ptr{cs_dl}, seed::Clong)::Ptr{Clong}
end

function cs_dl_post(parent, n)
    @ccall libcxsparse.cs_dl_post(parent::Ptr{Clong}, n::Clong)::Ptr{Clong}
end

function cs_dl_scc(A)
    @ccall libcxsparse.cs_dl_scc(A::Ptr{cs_dl})::Ptr{cs_dld}
end

function cs_dl_scatter(A, j, beta, w, x, mark, C, nz)
    @ccall libcxsparse.cs_dl_scatter(A::Ptr{cs_dl}, j::Clong, beta::Cdouble, w::Ptr{Clong}, x::Ptr{Cdouble}, mark::Clong, C::Ptr{cs_dl}, nz::Clong)::Clong
end

function cs_dl_tdfs(j, k, head, next, post, stack)
    @ccall libcxsparse.cs_dl_tdfs(j::Clong, k::Clong, head::Ptr{Clong}, next::Ptr{Clong}, post::Ptr{Clong}, stack::Ptr{Clong})::Clong
end

function cs_dl_leaf(i, j, first, maxfirst, prevleaf, ancestor, jleaf)
    @ccall libcxsparse.cs_dl_leaf(i::Clong, j::Clong, first::Ptr{Clong}, maxfirst::Ptr{Clong}, prevleaf::Ptr{Clong}, ancestor::Ptr{Clong}, jleaf::Ptr{Clong})::Clong
end

function cs_dl_reach(G, B, k, xi, pinv)
    @ccall libcxsparse.cs_dl_reach(G::Ptr{cs_dl}, B::Ptr{cs_dl}, k::Clong, xi::Ptr{Clong}, pinv::Ptr{Clong})::Clong
end

function cs_dl_spsolve(L, B, k, xi, x, pinv, lo)
    @ccall libcxsparse.cs_dl_spsolve(L::Ptr{cs_dl}, B::Ptr{cs_dl}, k::Clong, xi::Ptr{Clong}, x::Ptr{Cdouble}, pinv::Ptr{Clong}, lo::Clong)::Clong
end

function cs_dl_ereach(A, k, parent, s, w)
    @ccall libcxsparse.cs_dl_ereach(A::Ptr{cs_dl}, k::Clong, parent::Ptr{Clong}, s::Ptr{Clong}, w::Ptr{Clong})::Clong
end

function cs_dl_randperm(n, seed)
    @ccall libcxsparse.cs_dl_randperm(n::Clong, seed::Clong)::Ptr{Clong}
end

function cs_dl_dalloc(m, n)
    @ccall libcxsparse.cs_dl_dalloc(m::Clong, n::Clong)::Ptr{cs_dld}
end

function cs_dl_done(C, w, x, ok)
    @ccall libcxsparse.cs_dl_done(C::Ptr{cs_dl}, w::Ptr{Cvoid}, x::Ptr{Cvoid}, ok::Clong)::Ptr{cs_dl}
end

function cs_dl_idone(p, C, w, ok)
    @ccall libcxsparse.cs_dl_idone(p::Ptr{Clong}, C::Ptr{cs_dl}, w::Ptr{Cvoid}, ok::Clong)::Ptr{Clong}
end

function cs_dl_ndone(N, C, w, x, ok)
    @ccall libcxsparse.cs_dl_ndone(N::Ptr{cs_dln}, C::Ptr{cs_dl}, w::Ptr{Cvoid}, x::Ptr{Cvoid}, ok::Clong)::Ptr{cs_dln}
end

function cs_dl_ddone(D, C, w, ok)
    @ccall libcxsparse.cs_dl_ddone(D::Ptr{cs_dld}, C::Ptr{cs_dl}, w::Ptr{Cvoid}, ok::Clong)::Ptr{cs_dld}
end

struct cs_ci_sparse
    nzmax::Cint
    m::Cint
    n::Cint
    p::Ptr{Cint}
    i::Ptr{Cint}
    x::Ptr{ComplexF32}
    nz::Cint
end

const cs_ci = cs_ci_sparse

function cs_ci_add(A, B, alpha, beta)
    @ccall libcxsparse.cs_ci_add(A::Ptr{cs_ci}, B::Ptr{cs_ci}, alpha::ComplexF32, beta::ComplexF32)::Ptr{cs_ci}
end

function cs_ci_cholsol(order, A, b)
    @ccall libcxsparse.cs_ci_cholsol(order::Cint, A::Ptr{cs_ci}, b::Ptr{ComplexF32})::Cint
end

function cs_ci_dupl(A)
    @ccall libcxsparse.cs_ci_dupl(A::Ptr{cs_ci})::Cint
end

function cs_ci_entry(T, i, j, x)
    @ccall libcxsparse.cs_ci_entry(T::Ptr{cs_ci}, i::Cint, j::Cint, x::ComplexF32)::Cint
end

function cs_ci_lusol(order, A, b, tol)
    @ccall libcxsparse.cs_ci_lusol(order::Cint, A::Ptr{cs_ci}, b::Ptr{ComplexF32}, tol::Cdouble)::Cint
end

function cs_ci_gaxpy(A, x, y)
    @ccall libcxsparse.cs_ci_gaxpy(A::Ptr{cs_ci}, x::Ptr{ComplexF32}, y::Ptr{ComplexF32})::Cint
end

function cs_ci_multiply(A, B)
    @ccall libcxsparse.cs_ci_multiply(A::Ptr{cs_ci}, B::Ptr{cs_ci})::Ptr{cs_ci}
end

function cs_ci_qrsol(order, A, b)
    @ccall libcxsparse.cs_ci_qrsol(order::Cint, A::Ptr{cs_ci}, b::Ptr{ComplexF32})::Cint
end

function cs_ci_transpose(A, values)
    @ccall libcxsparse.cs_ci_transpose(A::Ptr{cs_ci}, values::Cint)::Ptr{cs_ci}
end

function cs_ci_compress(T)
    @ccall libcxsparse.cs_ci_compress(T::Ptr{cs_ci})::Ptr{cs_ci}
end

function cs_ci_norm(A)
    @ccall libcxsparse.cs_ci_norm(A::Ptr{cs_ci})::Cdouble
end

function cs_ci_print(A, brief)
    @ccall libcxsparse.cs_ci_print(A::Ptr{cs_ci}, brief::Cint)::Cint
end

function cs_ci_load(f)
    @ccall libcxsparse.cs_ci_load(f::Ptr{Libc.FILE})::Ptr{cs_ci}
end

function cs_ci_calloc(n, size)
    @ccall libcxsparse.cs_ci_calloc(n::Cint, size::Csize_t)::Ptr{Cvoid}
end

function cs_ci_free(p)
    @ccall libcxsparse.cs_ci_free(p::Ptr{Cvoid})::Ptr{Cvoid}
end

function cs_ci_realloc(p, n, size, ok)
    @ccall libcxsparse.cs_ci_realloc(p::Ptr{Cvoid}, n::Cint, size::Csize_t, ok::Ptr{Cint})::Ptr{Cvoid}
end

function cs_ci_spalloc(m, n, nzmax, values, t)
    @ccall libcxsparse.cs_ci_spalloc(m::Cint, n::Cint, nzmax::Cint, values::Cint, t::Cint)::Ptr{cs_ci}
end

function cs_ci_spfree(A)
    @ccall libcxsparse.cs_ci_spfree(A::Ptr{cs_ci})::Ptr{cs_ci}
end

function cs_ci_sprealloc(A, nzmax)
    @ccall libcxsparse.cs_ci_sprealloc(A::Ptr{cs_ci}, nzmax::Cint)::Cint
end

function cs_ci_malloc(n, size)
    @ccall libcxsparse.cs_ci_malloc(n::Cint, size::Csize_t)::Ptr{Cvoid}
end

mutable struct cs_ci_symbolic
    pinv::Ptr{Cint}
    q::Ptr{Cint}
    parent::Ptr{Cint}
    cp::Ptr{Cint}
    leftmost::Ptr{Cint}
    m2::Cint
    lnz::Cdouble
    unz::Cdouble
    cs_ci_symbolic() = new()
end

const cs_cis = cs_ci_symbolic

mutable struct cs_ci_numeric
    L::Ptr{cs_ci}
    U::Ptr{cs_ci}
    pinv::Ptr{Cint}
    B::Ptr{Cdouble}
    cs_ci_numeric() = new()
end

const cs_cin = cs_ci_numeric

mutable struct cs_ci_dmperm_results
    p::Ptr{Cint}
    q::Ptr{Cint}
    r::Ptr{Cint}
    s::Ptr{Cint}
    nb::Cint
    rr::NTuple{5, Cint}
    cc::NTuple{5, Cint}
    cs_ci_dmperm_results() = new()
end

const cs_cid = cs_ci_dmperm_results

function cs_ci_amd(order, A)
    @ccall libcxsparse.cs_ci_amd(order::Cint, A::Ptr{cs_ci})::Ptr{Cint}
end

function cs_ci_chol(A, S)
    @ccall libcxsparse.cs_ci_chol(A::Ptr{cs_ci}, S::Ptr{cs_cis})::Ptr{cs_cin}
end

function cs_ci_dmperm(A, seed)
    @ccall libcxsparse.cs_ci_dmperm(A::Ptr{cs_ci}, seed::Cint)::Ptr{cs_cid}
end

function cs_ci_droptol(A, tol)
    @ccall libcxsparse.cs_ci_droptol(A::Ptr{cs_ci}, tol::Cdouble)::Cint
end

function cs_ci_dropzeros(A)
    @ccall libcxsparse.cs_ci_dropzeros(A::Ptr{cs_ci})::Cint
end

function cs_ci_happly(V, i, beta, x)
    @ccall libcxsparse.cs_ci_happly(V::Ptr{cs_ci}, i::Cint, beta::Cdouble, x::Ptr{ComplexF32})::Cint
end

function cs_ci_ipvec(p, b, x, n)
    @ccall libcxsparse.cs_ci_ipvec(p::Ptr{Cint}, b::Ptr{ComplexF32}, x::Ptr{ComplexF32}, n::Cint)::Cint
end

function cs_ci_lsolve(L, x)
    @ccall libcxsparse.cs_ci_lsolve(L::Ptr{cs_ci}, x::Ptr{ComplexF32})::Cint
end

function cs_ci_ltsolve(L, x)
    @ccall libcxsparse.cs_ci_ltsolve(L::Ptr{cs_ci}, x::Ptr{ComplexF32})::Cint
end

function cs_ci_lu(A, S, tol)
    @ccall libcxsparse.cs_ci_lu(A::Ptr{cs_ci}, S::Ptr{cs_cis}, tol::Cdouble)::Ptr{cs_cin}
end

function cs_ci_permute(A, pinv, q, values)
    @ccall libcxsparse.cs_ci_permute(A::Ptr{cs_ci}, pinv::Ptr{Cint}, q::Ptr{Cint}, values::Cint)::Ptr{cs_ci}
end

function cs_ci_pinv(p, n)
    @ccall libcxsparse.cs_ci_pinv(p::Ptr{Cint}, n::Cint)::Ptr{Cint}
end

function cs_ci_pvec(p, b, x, n)
    @ccall libcxsparse.cs_ci_pvec(p::Ptr{Cint}, b::Ptr{ComplexF32}, x::Ptr{ComplexF32}, n::Cint)::Cint
end

function cs_ci_qr(A, S)
    @ccall libcxsparse.cs_ci_qr(A::Ptr{cs_ci}, S::Ptr{cs_cis})::Ptr{cs_cin}
end

function cs_ci_schol(order, A)
    @ccall libcxsparse.cs_ci_schol(order::Cint, A::Ptr{cs_ci})::Ptr{cs_cis}
end

function cs_ci_sqr(order, A, qr)
    @ccall libcxsparse.cs_ci_sqr(order::Cint, A::Ptr{cs_ci}, qr::Cint)::Ptr{cs_cis}
end

function cs_ci_symperm(A, pinv, values)
    @ccall libcxsparse.cs_ci_symperm(A::Ptr{cs_ci}, pinv::Ptr{Cint}, values::Cint)::Ptr{cs_ci}
end

function cs_ci_usolve(U, x)
    @ccall libcxsparse.cs_ci_usolve(U::Ptr{cs_ci}, x::Ptr{ComplexF32})::Cint
end

function cs_ci_utsolve(U, x)
    @ccall libcxsparse.cs_ci_utsolve(U::Ptr{cs_ci}, x::Ptr{ComplexF32})::Cint
end

function cs_ci_updown(L, sigma, C, parent)
    @ccall libcxsparse.cs_ci_updown(L::Ptr{cs_ci}, sigma::Cint, C::Ptr{cs_ci}, parent::Ptr{Cint})::Cint
end

function cs_ci_sfree(S)
    @ccall libcxsparse.cs_ci_sfree(S::Ptr{cs_cis})::Ptr{cs_cis}
end

function cs_ci_nfree(N)
    @ccall libcxsparse.cs_ci_nfree(N::Ptr{cs_cin})::Ptr{cs_cin}
end

function cs_ci_dfree(D)
    @ccall libcxsparse.cs_ci_dfree(D::Ptr{cs_cid})::Ptr{cs_cid}
end

function cs_ci_counts(A, parent, post, ata)
    @ccall libcxsparse.cs_ci_counts(A::Ptr{cs_ci}, parent::Ptr{Cint}, post::Ptr{Cint}, ata::Cint)::Ptr{Cint}
end

function cs_ci_cumsum(p, c, n)
    @ccall libcxsparse.cs_ci_cumsum(p::Ptr{Cint}, c::Ptr{Cint}, n::Cint)::Cdouble
end

function cs_ci_dfs(j, G, top, xi, pstack, pinv)
    @ccall libcxsparse.cs_ci_dfs(j::Cint, G::Ptr{cs_ci}, top::Cint, xi::Ptr{Cint}, pstack::Ptr{Cint}, pinv::Ptr{Cint})::Cint
end

function cs_ci_etree(A, ata)
    @ccall libcxsparse.cs_ci_etree(A::Ptr{cs_ci}, ata::Cint)::Ptr{Cint}
end

function cs_ci_fkeep(A, fkeep, other)
    @ccall libcxsparse.cs_ci_fkeep(A::Ptr{cs_ci}, fkeep::Ptr{Cvoid}, other::Ptr{Cvoid})::Cint
end

function cs_ci_house(x, beta, n)
    @ccall libcxsparse.cs_ci_house(x::Ptr{ComplexF32}, beta::Ptr{Cdouble}, n::Cint)::ComplexF32
end

function cs_ci_maxtrans(A, seed)
    @ccall libcxsparse.cs_ci_maxtrans(A::Ptr{cs_ci}, seed::Cint)::Ptr{Cint}
end

function cs_ci_post(parent, n)
    @ccall libcxsparse.cs_ci_post(parent::Ptr{Cint}, n::Cint)::Ptr{Cint}
end

function cs_ci_scc(A)
    @ccall libcxsparse.cs_ci_scc(A::Ptr{cs_ci})::Ptr{cs_cid}
end

function cs_ci_scatter(A, j, beta, w, x, mark, C, nz)
    @ccall libcxsparse.cs_ci_scatter(A::Ptr{cs_ci}, j::Cint, beta::ComplexF32, w::Ptr{Cint}, x::Ptr{ComplexF32}, mark::Cint, C::Ptr{cs_ci}, nz::Cint)::Cint
end

function cs_ci_tdfs(j, k, head, next, post, stack)
    @ccall libcxsparse.cs_ci_tdfs(j::Cint, k::Cint, head::Ptr{Cint}, next::Ptr{Cint}, post::Ptr{Cint}, stack::Ptr{Cint})::Cint
end

function cs_ci_leaf(i, j, first, maxfirst, prevleaf, ancestor, jleaf)
    @ccall libcxsparse.cs_ci_leaf(i::Cint, j::Cint, first::Ptr{Cint}, maxfirst::Ptr{Cint}, prevleaf::Ptr{Cint}, ancestor::Ptr{Cint}, jleaf::Ptr{Cint})::Cint
end

function cs_ci_reach(G, B, k, xi, pinv)
    @ccall libcxsparse.cs_ci_reach(G::Ptr{cs_ci}, B::Ptr{cs_ci}, k::Cint, xi::Ptr{Cint}, pinv::Ptr{Cint})::Cint
end

function cs_ci_spsolve(L, B, k, xi, x, pinv, lo)
    @ccall libcxsparse.cs_ci_spsolve(L::Ptr{cs_ci}, B::Ptr{cs_ci}, k::Cint, xi::Ptr{Cint}, x::Ptr{ComplexF32}, pinv::Ptr{Cint}, lo::Cint)::Cint
end

function cs_ci_ereach(A, k, parent, s, w)
    @ccall libcxsparse.cs_ci_ereach(A::Ptr{cs_ci}, k::Cint, parent::Ptr{Cint}, s::Ptr{Cint}, w::Ptr{Cint})::Cint
end

function cs_ci_randperm(n, seed)
    @ccall libcxsparse.cs_ci_randperm(n::Cint, seed::Cint)::Ptr{Cint}
end

function cs_ci_dalloc(m, n)
    @ccall libcxsparse.cs_ci_dalloc(m::Cint, n::Cint)::Ptr{cs_cid}
end

function cs_ci_done(C, w, x, ok)
    @ccall libcxsparse.cs_ci_done(C::Ptr{cs_ci}, w::Ptr{Cvoid}, x::Ptr{Cvoid}, ok::Cint)::Ptr{cs_ci}
end

function cs_ci_idone(p, C, w, ok)
    @ccall libcxsparse.cs_ci_idone(p::Ptr{Cint}, C::Ptr{cs_ci}, w::Ptr{Cvoid}, ok::Cint)::Ptr{Cint}
end

function cs_ci_ndone(N, C, w, x, ok)
    @ccall libcxsparse.cs_ci_ndone(N::Ptr{cs_cin}, C::Ptr{cs_ci}, w::Ptr{Cvoid}, x::Ptr{Cvoid}, ok::Cint)::Ptr{cs_cin}
end

function cs_ci_ddone(D, C, w, ok)
    @ccall libcxsparse.cs_ci_ddone(D::Ptr{cs_cid}, C::Ptr{cs_ci}, w::Ptr{Cvoid}, ok::Cint)::Ptr{cs_cid}
end

struct cs_cl_sparse
    nzmax::Clong
    m::Clong
    n::Clong
    p::Ptr{Clong}
    i::Ptr{Clong}
    x::Ptr{ComplexF32}
    nz::Clong
end

const cs_cl = cs_cl_sparse

function cs_cl_add(A, B, alpha, beta)
    @ccall libcxsparse.cs_cl_add(A::Ptr{cs_cl}, B::Ptr{cs_cl}, alpha::ComplexF32, beta::ComplexF32)::Ptr{cs_cl}
end

function cs_cl_cholsol(order, A, b)
    @ccall libcxsparse.cs_cl_cholsol(order::Clong, A::Ptr{cs_cl}, b::Ptr{ComplexF32})::Clong
end

function cs_cl_dupl(A)
    @ccall libcxsparse.cs_cl_dupl(A::Ptr{cs_cl})::Clong
end

function cs_cl_entry(T, i, j, x)
    @ccall libcxsparse.cs_cl_entry(T::Ptr{cs_cl}, i::Clong, j::Clong, x::ComplexF32)::Clong
end

function cs_cl_lusol(order, A, b, tol)
    @ccall libcxsparse.cs_cl_lusol(order::Clong, A::Ptr{cs_cl}, b::Ptr{ComplexF32}, tol::Cdouble)::Clong
end

function cs_cl_gaxpy(A, x, y)
    @ccall libcxsparse.cs_cl_gaxpy(A::Ptr{cs_cl}, x::Ptr{ComplexF32}, y::Ptr{ComplexF32})::Clong
end

function cs_cl_multiply(A, B)
    @ccall libcxsparse.cs_cl_multiply(A::Ptr{cs_cl}, B::Ptr{cs_cl})::Ptr{cs_cl}
end

function cs_cl_qrsol(order, A, b)
    @ccall libcxsparse.cs_cl_qrsol(order::Clong, A::Ptr{cs_cl}, b::Ptr{ComplexF32})::Clong
end

function cs_cl_transpose(A, values)
    @ccall libcxsparse.cs_cl_transpose(A::Ptr{cs_cl}, values::Clong)::Ptr{cs_cl}
end

function cs_cl_compress(T)
    @ccall libcxsparse.cs_cl_compress(T::Ptr{cs_cl})::Ptr{cs_cl}
end

function cs_cl_norm(A)
    @ccall libcxsparse.cs_cl_norm(A::Ptr{cs_cl})::Cdouble
end

function cs_cl_print(A, brief)
    @ccall libcxsparse.cs_cl_print(A::Ptr{cs_cl}, brief::Clong)::Clong
end

function cs_cl_load(f)
    @ccall libcxsparse.cs_cl_load(f::Ptr{Libc.FILE})::Ptr{cs_cl}
end

function cs_cl_calloc(n, size)
    @ccall libcxsparse.cs_cl_calloc(n::Clong, size::Csize_t)::Ptr{Cvoid}
end

function cs_cl_free(p)
    @ccall libcxsparse.cs_cl_free(p::Ptr{Cvoid})::Ptr{Cvoid}
end

function cs_cl_realloc(p, n, size, ok)
    @ccall libcxsparse.cs_cl_realloc(p::Ptr{Cvoid}, n::Clong, size::Csize_t, ok::Ptr{Clong})::Ptr{Cvoid}
end

function cs_cl_spalloc(m, n, nzmax, values, t)
    @ccall libcxsparse.cs_cl_spalloc(m::Clong, n::Clong, nzmax::Clong, values::Clong, t::Clong)::Ptr{cs_cl}
end

function cs_cl_spfree(A)
    @ccall libcxsparse.cs_cl_spfree(A::Ptr{cs_cl})::Ptr{cs_cl}
end

function cs_cl_sprealloc(A, nzmax)
    @ccall libcxsparse.cs_cl_sprealloc(A::Ptr{cs_cl}, nzmax::Clong)::Clong
end

function cs_cl_malloc(n, size)
    @ccall libcxsparse.cs_cl_malloc(n::Clong, size::Csize_t)::Ptr{Cvoid}
end

mutable struct cs_cl_symbolic
    pinv::Ptr{Clong}
    q::Ptr{Clong}
    parent::Ptr{Clong}
    cp::Ptr{Clong}
    leftmost::Ptr{Clong}
    m2::Clong
    lnz::Cdouble
    unz::Cdouble
    cs_cl_symbolic() = new()
end

const cs_cls = cs_cl_symbolic

mutable struct cs_cl_numeric
    L::Ptr{cs_cl}
    U::Ptr{cs_cl}
    pinv::Ptr{Clong}
    B::Ptr{Cdouble}
    cs_cl_numeric() = new()
end

const cs_cln = cs_cl_numeric

mutable struct cs_cl_dmperm_results
    p::Ptr{Clong}
    q::Ptr{Clong}
    r::Ptr{Clong}
    s::Ptr{Clong}
    nb::Clong
    rr::NTuple{5, Clong}
    cc::NTuple{5, Clong}
    cs_cl_dmperm_results() = new()
end

const cs_cld = cs_cl_dmperm_results

function cs_cl_amd(order, A)
    @ccall libcxsparse.cs_cl_amd(order::Clong, A::Ptr{cs_cl})::Ptr{Clong}
end

function cs_cl_chol(A, S)
    @ccall libcxsparse.cs_cl_chol(A::Ptr{cs_cl}, S::Ptr{cs_cls})::Ptr{cs_cln}
end

function cs_cl_dmperm(A, seed)
    @ccall libcxsparse.cs_cl_dmperm(A::Ptr{cs_cl}, seed::Clong)::Ptr{cs_cld}
end

function cs_cl_droptol(A, tol)
    @ccall libcxsparse.cs_cl_droptol(A::Ptr{cs_cl}, tol::Cdouble)::Clong
end

function cs_cl_dropzeros(A)
    @ccall libcxsparse.cs_cl_dropzeros(A::Ptr{cs_cl})::Clong
end

function cs_cl_happly(V, i, beta, x)
    @ccall libcxsparse.cs_cl_happly(V::Ptr{cs_cl}, i::Clong, beta::Cdouble, x::Ptr{ComplexF32})::Clong
end

function cs_cl_ipvec(p, b, x, n)
    @ccall libcxsparse.cs_cl_ipvec(p::Ptr{Clong}, b::Ptr{ComplexF32}, x::Ptr{ComplexF32}, n::Clong)::Clong
end

function cs_cl_lsolve(L, x)
    @ccall libcxsparse.cs_cl_lsolve(L::Ptr{cs_cl}, x::Ptr{ComplexF32})::Clong
end

function cs_cl_ltsolve(L, x)
    @ccall libcxsparse.cs_cl_ltsolve(L::Ptr{cs_cl}, x::Ptr{ComplexF32})::Clong
end

function cs_cl_lu(A, S, tol)
    @ccall libcxsparse.cs_cl_lu(A::Ptr{cs_cl}, S::Ptr{cs_cls}, tol::Cdouble)::Ptr{cs_cln}
end

function cs_cl_permute(A, pinv, q, values)
    @ccall libcxsparse.cs_cl_permute(A::Ptr{cs_cl}, pinv::Ptr{Clong}, q::Ptr{Clong}, values::Clong)::Ptr{cs_cl}
end

function cs_cl_pinv(p, n)
    @ccall libcxsparse.cs_cl_pinv(p::Ptr{Clong}, n::Clong)::Ptr{Clong}
end

function cs_cl_pvec(p, b, x, n)
    @ccall libcxsparse.cs_cl_pvec(p::Ptr{Clong}, b::Ptr{ComplexF32}, x::Ptr{ComplexF32}, n::Clong)::Clong
end

function cs_cl_qr(A, S)
    @ccall libcxsparse.cs_cl_qr(A::Ptr{cs_cl}, S::Ptr{cs_cls})::Ptr{cs_cln}
end

function cs_cl_schol(order, A)
    @ccall libcxsparse.cs_cl_schol(order::Clong, A::Ptr{cs_cl})::Ptr{cs_cls}
end

function cs_cl_sqr(order, A, qr)
    @ccall libcxsparse.cs_cl_sqr(order::Clong, A::Ptr{cs_cl}, qr::Clong)::Ptr{cs_cls}
end

function cs_cl_symperm(A, pinv, values)
    @ccall libcxsparse.cs_cl_symperm(A::Ptr{cs_cl}, pinv::Ptr{Clong}, values::Clong)::Ptr{cs_cl}
end

function cs_cl_usolve(U, x)
    @ccall libcxsparse.cs_cl_usolve(U::Ptr{cs_cl}, x::Ptr{ComplexF32})::Clong
end

function cs_cl_utsolve(U, x)
    @ccall libcxsparse.cs_cl_utsolve(U::Ptr{cs_cl}, x::Ptr{ComplexF32})::Clong
end

function cs_cl_updown(L, sigma, C, parent)
    @ccall libcxsparse.cs_cl_updown(L::Ptr{cs_cl}, sigma::Clong, C::Ptr{cs_cl}, parent::Ptr{Clong})::Clong
end

function cs_cl_sfree(S)
    @ccall libcxsparse.cs_cl_sfree(S::Ptr{cs_cls})::Ptr{cs_cls}
end

function cs_cl_nfree(N)
    @ccall libcxsparse.cs_cl_nfree(N::Ptr{cs_cln})::Ptr{cs_cln}
end

function cs_cl_dfree(D)
    @ccall libcxsparse.cs_cl_dfree(D::Ptr{cs_cld})::Ptr{cs_cld}
end

function cs_cl_counts(A, parent, post, ata)
    @ccall libcxsparse.cs_cl_counts(A::Ptr{cs_cl}, parent::Ptr{Clong}, post::Ptr{Clong}, ata::Clong)::Ptr{Clong}
end

function cs_cl_cumsum(p, c, n)
    @ccall libcxsparse.cs_cl_cumsum(p::Ptr{Clong}, c::Ptr{Clong}, n::Clong)::Cdouble
end

function cs_cl_dfs(j, G, top, xi, pstack, pinv)
    @ccall libcxsparse.cs_cl_dfs(j::Clong, G::Ptr{cs_cl}, top::Clong, xi::Ptr{Clong}, pstack::Ptr{Clong}, pinv::Ptr{Clong})::Clong
end

function cs_cl_etree(A, ata)
    @ccall libcxsparse.cs_cl_etree(A::Ptr{cs_cl}, ata::Clong)::Ptr{Clong}
end

function cs_cl_fkeep(A, fkeep, other)
    @ccall libcxsparse.cs_cl_fkeep(A::Ptr{cs_cl}, fkeep::Ptr{Cvoid}, other::Ptr{Cvoid})::Clong
end

function cs_cl_house(x, beta, n)
    @ccall libcxsparse.cs_cl_house(x::Ptr{ComplexF32}, beta::Ptr{Cdouble}, n::Clong)::ComplexF32
end

function cs_cl_maxtrans(A, seed)
    @ccall libcxsparse.cs_cl_maxtrans(A::Ptr{cs_cl}, seed::Clong)::Ptr{Clong}
end

function cs_cl_post(parent, n)
    @ccall libcxsparse.cs_cl_post(parent::Ptr{Clong}, n::Clong)::Ptr{Clong}
end

function cs_cl_scc(A)
    @ccall libcxsparse.cs_cl_scc(A::Ptr{cs_cl})::Ptr{cs_cld}
end

function cs_cl_scatter(A, j, beta, w, x, mark, C, nz)
    @ccall libcxsparse.cs_cl_scatter(A::Ptr{cs_cl}, j::Clong, beta::ComplexF32, w::Ptr{Clong}, x::Ptr{ComplexF32}, mark::Clong, C::Ptr{cs_cl}, nz::Clong)::Clong
end

function cs_cl_tdfs(j, k, head, next, post, stack)
    @ccall libcxsparse.cs_cl_tdfs(j::Clong, k::Clong, head::Ptr{Clong}, next::Ptr{Clong}, post::Ptr{Clong}, stack::Ptr{Clong})::Clong
end

function cs_cl_leaf(i, j, first, maxfirst, prevleaf, ancestor, jleaf)
    @ccall libcxsparse.cs_cl_leaf(i::Clong, j::Clong, first::Ptr{Clong}, maxfirst::Ptr{Clong}, prevleaf::Ptr{Clong}, ancestor::Ptr{Clong}, jleaf::Ptr{Clong})::Clong
end

function cs_cl_reach(G, B, k, xi, pinv)
    @ccall libcxsparse.cs_cl_reach(G::Ptr{cs_cl}, B::Ptr{cs_cl}, k::Clong, xi::Ptr{Clong}, pinv::Ptr{Clong})::Clong
end

function cs_cl_spsolve(L, B, k, xi, x, pinv, lo)
    @ccall libcxsparse.cs_cl_spsolve(L::Ptr{cs_cl}, B::Ptr{cs_cl}, k::Clong, xi::Ptr{Clong}, x::Ptr{ComplexF32}, pinv::Ptr{Clong}, lo::Clong)::Clong
end

function cs_cl_ereach(A, k, parent, s, w)
    @ccall libcxsparse.cs_cl_ereach(A::Ptr{cs_cl}, k::Clong, parent::Ptr{Clong}, s::Ptr{Clong}, w::Ptr{Clong})::Clong
end

function cs_cl_randperm(n, seed)
    @ccall libcxsparse.cs_cl_randperm(n::Clong, seed::Clong)::Ptr{Clong}
end

function cs_cl_dalloc(m, n)
    @ccall libcxsparse.cs_cl_dalloc(m::Clong, n::Clong)::Ptr{cs_cld}
end

function cs_cl_done(C, w, x, ok)
    @ccall libcxsparse.cs_cl_done(C::Ptr{cs_cl}, w::Ptr{Cvoid}, x::Ptr{Cvoid}, ok::Clong)::Ptr{cs_cl}
end

function cs_cl_idone(p, C, w, ok)
    @ccall libcxsparse.cs_cl_idone(p::Ptr{Clong}, C::Ptr{cs_cl}, w::Ptr{Cvoid}, ok::Clong)::Ptr{Clong}
end

function cs_cl_ndone(N, C, w, x, ok)
    @ccall libcxsparse.cs_cl_ndone(N::Ptr{cs_cln}, C::Ptr{cs_cl}, w::Ptr{Cvoid}, x::Ptr{Cvoid}, ok::Clong)::Ptr{cs_cln}
end

function cs_cl_ddone(D, C, w, ok)
    @ccall libcxsparse.cs_cl_ddone(D::Ptr{cs_cld}, C::Ptr{cs_cl}, w::Ptr{Cvoid}, ok::Clong)::Ptr{cs_cld}
end

function cs_i_real(A, real)
    @ccall libcxsparse.cs_i_real(A::Ptr{cs_ci}, real::Cint)::Ptr{cs_di}
end

function cs_i_complex(A, real)
    @ccall libcxsparse.cs_i_complex(A::Ptr{cs_di}, real::Cint)::Ptr{cs_ci}
end

function cs_l_real(A, real)
    @ccall libcxsparse.cs_l_real(A::Ptr{cs_cl}, real::Clong)::Ptr{cs_dl}
end

function cs_l_complex(A, real)
    @ccall libcxsparse.cs_l_complex(A::Ptr{cs_dl}, real::Clong)::Ptr{cs_cl}
end

const SuiteSparse_long = Clong

const SuiteSparse_long_max = LONG_MAX

const SuiteSparse_long_idd = "ld"

const SUITESPARSE_DATE = "Apr 10, 2022"

SUITESPARSE_VER_CODE(main, sub) = main * 1000 + sub

const SUITESPARSE_MAIN_VERSION = 5

const SUITESPARSE_SUB_VERSION = 12

const SUITESPARSE_SUBSUB_VERSION = 0

const SUITESPARSE_VERSION = SUITESPARSE_VER_CODE(SUITESPARSE_MAIN_VERSION, SUITESPARSE_SUB_VERSION)

# Skipping MacroDefinition: cs_complex_t double _Complex

const CS_VER = 3

const CS_SUBVER = 2

const CS_SUBSUB = 0

const CS_DATE = "Sept 12, 2017"

const CS_COPYRIGHT = "Copyright (c) Timothy A. Davis, 2006-2016"

const cs_long_t = SuiteSparse_long

const cs_long_t_id = SuiteSparse_long_id

const cs_long_t_max = SuiteSparse_long_max

const CS_INT = Cint

const CS_INT_MAX = INT_MAX

const CS_ID = "%d"

const CS_ENTRY = Float64

const cs = cs_di

const cs_add = CS_NAME(_add)

const cs_cholsol = CS_NAME(_cholsol)

const cs_dupl = CS_NAME(_dupl)

const cs_entry = CS_NAME(_entry)

const cs_lusol = CS_NAME(_lusol)

const cs_gaxpy = CS_NAME(_gaxpy)

const cs_multiply = CS_NAME(_multiply)

const cs_qrsol = CS_NAME(_qrsol)

const cs_transpose = CS_NAME(_transpose)

const cs_compress = CS_NAME(_compress)

const cs_norm = CS_NAME(_norm)

const cs_print = CS_NAME(_print)

const cs_load = CS_NAME(_load)

const cs_calloc = CS_NAME(_calloc)

const cs_free = CS_NAME(_free)

const cs_realloc = CS_NAME(_realloc)

const cs_spalloc = CS_NAME(_spalloc)

const cs_spfree = CS_NAME(_spfree)

const cs_sprealloc = CS_NAME(_sprealloc)

const cs_malloc = CS_NAME(_malloc)

const css = CS_NAME(s)

const csn = CS_NAME(n)

const csd = CS_NAME(d)

const cs_amd = CS_NAME(_amd)

const cs_chol = CS_NAME(_chol)

const cs_dmperm = CS_NAME(_dmperm)

const cs_droptol = CS_NAME(_droptol)

const cs_dropzeros = CS_NAME(_dropzeros)

const cs_happly = CS_NAME(_happly)

const cs_ipvec = CS_NAME(_ipvec)

const cs_lsolve = CS_NAME(_lsolve)

const cs_ltsolve = CS_NAME(_ltsolve)

const cs_lu = CS_NAME(_lu)

const cs_permute = CS_NAME(_permute)

const cs_pinv = CS_NAME(_pinv)

const cs_pvec = CS_NAME(_pvec)

const cs_qr = CS_NAME(_qr)

const cs_schol = CS_NAME(_schol)

const cs_sqr = CS_NAME(_sqr)

const cs_symperm = CS_NAME(_symperm)

const cs_usolve = CS_NAME(_usolve)

const cs_utsolve = CS_NAME(_utsolve)

const cs_updown = CS_NAME(_updown)

const cs_sfree = CS_NAME(_sfree)

const cs_nfree = CS_NAME(_nfree)

const cs_dfree = CS_NAME(_dfree)

const cs_counts = CS_NAME(_counts)

const cs_cumsum = CS_NAME(_cumsum)

const cs_dfs = CS_NAME(_dfs)

const cs_etree = CS_NAME(_etree)

const cs_fkeep = CS_NAME(_fkeep)

const cs_house = CS_NAME(_house)

const cs_invmatch = CS_NAME(_invmatch)

const cs_maxtrans = CS_NAME(_maxtrans)

const cs_post = CS_NAME(_post)

const cs_scc = CS_NAME(_scc)

const cs_scatter = CS_NAME(_scatter)

const cs_tdfs = CS_NAME(_tdfs)

const cs_reach = CS_NAME(_reach)

const cs_spsolve = CS_NAME(_spsolve)

const cs_ereach = CS_NAME(_ereach)

const cs_randperm = CS_NAME(_randperm)

const cs_leaf = CS_NAME(_leaf)

const cs_dalloc = CS_NAME(_dalloc)

const cs_done = CS_NAME(_done)

const cs_idone = CS_NAME(_idone)

const cs_ndone = CS_NAME(_ndone)

const cs_ddone = CS_NAME(_ddone)

