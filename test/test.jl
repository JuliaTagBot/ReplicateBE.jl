# ReplicateBE
# Author: Vladimir Arnautov aka PharmCat
# Copyright © 2019 Vladimir Arnautov aka PharmCat <mail@pharmcat.net>
# Licence: GNU General Public License v3.0

using Test, DataFrames, CSV

include("testdata.jl")

@testset "  Mixed model test       " begin
    df = CSV.read(IOBuffer(minibe)) |> DataFrame
    be = ReplicateBE.rbe(df, dvar = :var, subject = :subject, formulation = :formulation, period = :period, sequence = :sequence);
    @test be.β[6]  ≈  -0.0791666 atol=1E-6
    @test be.se[6] ≈   0.0903709 atol=1E-6
    @test be.reml  ≈  10.0652386 atol=1E-6
end
