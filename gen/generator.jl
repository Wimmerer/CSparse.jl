#! /bin/bash julia --project generator.jl
using Pkg
using Pkg.Artifacts
using Clang.Generators
using Clang.Generators.JLLEnvs
using CXSparse_jll

cd(@__DIR__)

CXSparse_dir = CXSparse_jll.find_artifact_dir()
include_dir = joinpath(CXSparse_dir, "include") |> normpath
cs_h = joinpath(include_dir, "cs.h")
@assert isfile(cs_h)

ssconfig_h = joinpath(@__DIR__, "SuiteSparse_config.h")
# load common option
options = load_options(joinpath(@__DIR__, "generator.toml"))

# run generator for all platforms
for target in JLLEnvs.JLL_ENV_TRIPLES
    @info "processing $target"

    options["general"]["output_file_path"] = joinpath(@__DIR__, "..", "lib", "$target.jl")

    args = get_default_args(target)
    push!(args, "-I$include_dir")
    if startswith(target, "x86_64") || startswith(target, "powerpc64le") || startswith(target, "aarch64")
        push!(args, "-DSUN64 -DLONGBLAS='long long' -D'SuiteSparse_long_max=9223372036854775801'")
    end

    header_files = [cs_h, ssconfig_h]

    ctx = create_context(header_files, args, options)

    build!(ctx)
end
