button = script.Parent
local code
wait(5)

button.MouseButton1Click:Connect(function()

	print(script.Parent.Parent.TextBox.Text)
	code = script.Parent.Parent.TextBox.Text
	print(code)
	game.ReplicatedStorage.Execute:FireServer(code)

end)
