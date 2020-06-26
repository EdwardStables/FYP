using Plots

#LISWET1 500 Iterations
times = [ 4.0253431002299 ,7.94892191886902 ,11.5433382987976 ,15.0310873190562 ,19.176594654719 ,23.7331656614939 ,26.8767603238424 ,31.4313920338949 ,35.0544998645782 ,38.6166709264119 ]



iterations = [50 ,100 ,150 ,200 ,250 ,300 ,350 ,400 ,450 ,500]

plot(iterations, times, label="LISWET1 Runtime", legend=:bottomright)
xlabel!("Iterations")
ylabel!("Runtime (s)")

