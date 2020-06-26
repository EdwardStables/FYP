@testset "SetInitialPoint" begin
    p = DSProblem(2)
    @test_throws ErrorException SetInitialPoint(p, [1.0, 1.0, 1.0])
    SetInitialPoint(p, [5.0, 5.0])
    @test p.user_initial_point == [5.0, 5.0]
end
