# Roam
Bruce Tate presented a live coding webinar to demonstrate functional data concepts, how to isolate a functional core and build beautiful boundary layers. 

iex(1)> [1, 2, 3] |> Enum.reduce(fn item, acc -> item + acc end)
iex(3)> alias Roam.Core.Rover

iex(6)> Rover.__struct__     
%Roam.Core.Rover{moves: [], orientation: :north, position: {0, 0}}

iex(8)> Rover.new       
%Roam.Core.Rover{moves: [], orientation: :north, position: {0, 0}}

iex(13)> Rover.new |> Rover.move(?f)
%Roam.Core.Rover{moves: 'f', orientation: :north, position: {0, 0}}

iex(23)> pid = spawn(fn -> Roam.Boundary.Server.run(Rover.new) end)
#PID<0.347.0>
iex(24)>spawn(fn -> Roam.Boundary.Server.run(Rover.new) end)
iex(25)> server = v(24)


iex(25)> send server, {:move, ?f}
{:move, 102}

iex(26)> send server, {:state, self}
{:state, #PID<0.164.0>}

iex(27)> receive do m -> m end
%Roam.Core.Rover{moves: 'f', orientation: :north, position: {0, 1}}

