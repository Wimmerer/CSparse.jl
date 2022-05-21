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
options["general"]["output_file_path"] = joinpath(@__DIR__, "..", "lib", "libcsparse.jl")
# run generator for all platforms
args = get_default_args()
push!(args, "--include=$ssconfig_h")
push!(args, "-I$include_dir")
header_files = [cs_h]
ctx = create_context(header_files, args, options)
build!(ctx)
