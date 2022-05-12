using CSparse
using Documenter

DocMeta.setdocmeta!(CSparse, :DocTestSetup, :(using CSparse); recursive=true)

makedocs(;
    modules=[CSparse],
    authors="Ray Kimmerer <kimmerer@mit.edu> and contributors",
    repo="https://github.com/Wimmerer/CSparse.jl/blob/{commit}{path}#{line}",
    sitename="CSparse.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://Wimmerer.github.io/CSparse.jl",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/Wimmerer/CSparse.jl",
    devbranch="main",
)
