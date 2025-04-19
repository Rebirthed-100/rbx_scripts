local ui_lib = {}

function ui_lib:NewGui()
	for _,v in pairs(game:GetService("CoreGui"):GetDescendants()) do
		if v:IsA('StringValue') and tostring(v.Name) == "dizzy_hub" then
			v.Parent:Destroy();
		end
	end

	local gui = Instance.new("ScreenGui");
	gui.DisplayOrder = math.random(5, 10);
	gui.ResetOnSpawn = false;
	gui.IgnoreGuiInset = true;
	gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
	gui.Enabled = true;
	gui.Parent = game:GetService("CoreGui");

	local char_set = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%&()*+-,./\:;<=>?^[]{}";
	local length = math.random(30, 50);
	local generated = "";

	for i = 1, length do
		local rand = math.random(#char_set)
		generated = generated .. string.sub(char_set, rand, rand)
		
		for i=1,math.random(5, 10) do
			local rand_char = math.random(1, length);
			gui.Name = string.sub(generated, 1, rand_char-1) .. "\n" .. string.sub(generated, rand_char+1)
		end
	end

	local str_v = Instance.new("StringValue");
	str_v.Name = "dizzy_hub";
	str_v.Parent = gui;

	local main_frame = Instance.new("Frame");
	main_frame.Active = true;
	main_frame.BackgroundTransparency = 0;
	main_frame.BackgroundColor3 = Color3.fromRGB(24, 24, 24);
	main_frame.BorderSizePixel = 0;
	main_frame.Draggable = true;
	main_frame.ZIndex = 4;
	main_frame.Size = UDim2.fromScale(0.31, 0.338);
	main_frame.Position = UDim2.fromScale(0.345, 0.331);
	main_frame.Name = "Main";
	main_frame.ClipsDescendants = true;
	main_frame.Parent = gui;

	local ui_aspectratio = Instance.new("UIAspectRatioConstraint");
	ui_aspectratio.AspectRatio = 1.63;
	ui_aspectratio.AspectType = Enum.AspectType.ScaleWithParentSize;
	ui_aspectratio.DominantAxis = Enum.DominantAxis.Height;
	ui_aspectratio.Parent = main_frame;

	local tabs_frame = Instance.new("ImageLabel");
	tabs_frame.Active = false;
	tabs_frame.BackgroundTransparency = 1;
	tabs_frame.BorderSizePixel = 0;
	tabs_frame.Size = UDim2.fromScale(0.23, 1);
	tabs_frame.Position = UDim2.fromScale(0, 0);
	tabs_frame.Name = "Tabs";
	tabs_frame.ZIndex = 3;
	tabs_frame.Image = "http://www.roblox.com/asset/?id=14596612336";
	tabs_frame.ImageTransparency = 0;
	tabs_frame.ClipsDescendants = true;
	tabs_frame.Parent = main_frame;

	local ui_c = Instance.new("UICorner");
	ui_c.CornerRadius = UDim.new(0, 8);
	ui_c.Parent = main_frame;

	local ui_stroke = Instance.new("UIStroke");
	ui_stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
	ui_stroke.Color = Color3.fromRGB(38, 38, 38);
	ui_stroke.LineJoinMode = Enum.LineJoinMode.Round;
	ui_stroke.Thickness = 1;
	ui_stroke.Transparency = 0;
	ui_stroke.Parent = tabs_frame;

	local tabs_main_frame = Instance.new("Frame");
	tabs_main_frame.BackgroundTransparency = 1;
	tabs_main_frame.Visible = true;
	tabs_main_frame.Name = "Main";
	tabs_main_frame.Size = UDim2.fromScale(1, 0.88);
	tabs_main_frame.Position = UDim2.fromScale(0, 0.12);
	tabs_main_frame.Parent = tabs_frame;

	local ui_list_layout = Instance.new("UIListLayout");
	ui_list_layout.FillDirection = Enum.FillDirection.Vertical;
	ui_list_layout.HorizontalAlignment = Enum.HorizontalAlignment.Center;
	ui_list_layout.SortOrder = Enum.SortOrder.LayoutOrder;
	ui_list_layout.VerticalAlignment = Enum.VerticalAlignment.Top;
	ui_list_layout.Padding = UDim.new(0, 8);
	ui_list_layout.Parent = tabs_main_frame;

	local tab_frames = Instance.new("Frame");
	tab_frames.Size = UDim2.fromScale(0.759, 0.9);
	tab_frames.Position = UDim2.fromScale(0.241, 0.09);
	tab_frames.BackgroundTransparency = 1;
	tab_frames.ZIndex = 3;
	tab_frames.Name = "TabFrames";
	tab_frames.ClipsDescendants = true;
	tab_frames.Parent = main_frame;

	local title = Instance.new("TextLabel");
	title.Active = false;
	title.BackgroundTransparency = 1;
	title.Size = UDim2.fromScale(1, 0.05);
	title.Position = UDim2.fromScale(0, 0.02);
	title.Visible = true;
	title.Text = "dizzy hub";
	title.Font = Enum.Font.Gotham;
	title.TextScaled = true;
	title.TextColor3 = Color3.fromRGB(255, 255, 255);
	title.TextStrokeColor3 = Color3.fromRGB(255, 255, 255);
	title.TextStrokeTransparency = 1;
	title.Name = "Title";
	title.TextXAlignment = Enum.TextXAlignment.Center;
	title.Parent = main_frame;

	local tween1 = game:GetService("TweenService"):Create(title, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(255, 255, 255), TextStrokeTransparency = 0.8});
	local tween2 = game:GetService("TweenService"):Create(title, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {TextColor3 = Color3.fromRGB(200, 200, 200), TextStrokeTransparency = 1});
	task.spawn(function()
		while task.wait(3) do
			if gui == nil or title == nil then
				break;
			end

			tween1:Play();
			tween1.Completed:Wait();

			task.wait(3);

			tween2:Play();
			tween2.Completed:Wait();
		end
	end)

	local settings_button = Instance.new("ImageButton");
	settings_button.Active = true;
	settings_button.BackgroundTransparency = 1;
	settings_button.Name = "Settings_Button";
	settings_button.Position = UDim2.fromScale(0.005, 0.015);
	settings_button.Size = UDim2.fromScale(0.04, 0.07);
	settings_button.Image = "rbxassetid://1185031129";
	settings_button.Visible = true;
	settings_button.ZIndex = 3;
	settings_button.Parent = main_frame;
	
	local settings_frame = Instance.new("Frame");
	settings_frame.Size = UDim2.fromScale(0.759, 0.9);
	settings_frame.Position = UDim2.fromScale(0.241, 0.09);
	settings_frame.BackgroundTransparency = 1;
	settings_frame.ZIndex = 3;
	settings_frame.Name = "Settings";
	settings_frame.Visible = false;
	settings_frame.ClipsDescendants = true;
	settings_frame.Parent = main_frame;

	local settings_main_frame = Instance.new("ScrollingFrame");
	settings_main_frame.Active = false;
	settings_main_frame.BackgroundTransparency = 1;
	settings_main_frame.Position = UDim2.fromScale(0.01, 1);
	settings_main_frame.Size = UDim2.fromScale(1, 1);
	settings_main_frame.Visible = false;
	settings_main_frame.CanvasSize = UDim2.fromScale(0, 1.5);
	settings_main_frame.CanvasPosition = Vector2.new(0, 0);
	settings_main_frame.ScrollBarImageColor3 = Color3.fromRGB(60, 60, 60);
	settings_main_frame.ScrollBarThickness = 6;
	settings_main_frame.ScrollBarImageTransparency = 1;
	settings_main_frame.ScrollingDirection = Enum.ScrollingDirection.Y;
	settings_main_frame.MidImage = "rbxasset://textures/ui/Scroll/scroll-middle.png";
	settings_main_frame.TopImage = "rbxasset://textures/ui/Scroll/scroll-top.png";
	settings_main_frame.BottomImage = "rbxasset://textures/ui/Scroll/scroll-bottom.png";
	settings_main_frame.Name = "Settings_MainFrame";
	settings_main_frame.ZIndex = 3;
	settings_main_frame.BorderSizePixel = 0;
	settings_main_frame.ClipsDescendants = false;
	settings_main_frame.Parent = tab_frames;
	
	local ui_list_layout = Instance.new("UIListLayout");
	ui_list_layout.FillDirection = Enum.FillDirection.Vertical;
	ui_list_layout.HorizontalAlignment = Enum.HorizontalAlignment.Left;
	ui_list_layout.SortOrder = Enum.SortOrder.LayoutOrder;
	ui_list_layout.VerticalAlignment = Enum.VerticalAlignment.Top;
	ui_list_layout.Padding = UDim.new(0, 7);
	ui_list_layout.Parent = settings_main_frame;

	local close_gui = Instance.new("TextButton");
	close_gui.BackgroundTransparency = 1;
	close_gui.Active = true;
	close_gui.AutoButtonColor = false;
	close_gui.Visible = true;
	close_gui.Style = Enum.ButtonStyle.Custom;
	close_gui.Visible = true;
	close_gui.ZIndex = 2;
	close_gui.Name = "Close_Gui";
	close_gui.Text = "X";
	close_gui.TextColor3 = Color3.fromRGB(255, 255, 255);
	close_gui.TextSize = 11;
	close_gui.TextStrokeTransparency = 1;
	close_gui.Size = UDim2.fromScale(0.036, 0.06);
	close_gui.Position = UDim2.fromScale(0.955, 0.015);
	close_gui.TextScaled = true;
	close_gui.Parent = main_frame;

	local gui_funcs = {};
	
	function gui_funcs:BindToClose(action)
		gui.AncestryChanged:Connect(function(property)
			if not gui.Parent or gui == nil then
				coroutine.resume(coroutine.create(action));
			end
		end)
	end

	close_gui.MouseButton1Click:Connect(function()
		main_frame.Draggable = false;
		close_gui.Active = false;
		
		local old_frame_pos = main_frame.Position;
		
		for _,tab in pairs(tabs_main_frame:GetChildren()) do
			if tab:IsA("TextButton") then
				game:GetService("TweenService"):Create(tab, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {TextTransparency = 1}):Play();
			end
		end
		
		game:GetService("TweenService"):Create(main_frame, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {BackgroundTransparency = 1}):Play();
		game:GetService("TweenService"):Create(tabs_frame, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {ImageTransparency = 1}):Play();
		
		main_frame:TweenSizeAndPosition(UDim2.fromScale(0, 0), UDim2.new(old_frame_pos.X.Scale, old_frame_pos.X.Offset, old_frame_pos.Y.Scale, old_frame_pos.Y.Offset), Enum.EasingDirection.Out, Enum.EasingStyle.Sine, 0.5, true, function() gui:Destroy() end)
	end)

	local function ChangeTransparency(instance, value)
		local text = {"TextButton", "TextBox", "TextLabel"};
		local background = {"TextButton", "Frame", "TextBox"};

		if table.find(text, instance.ClassName) then
			game:GetService("TweenService"):Create(instance, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {TextTransparency = value}):Play();
		end

		if table.find(background, instance.ClassName) then
			game:GetService("TweenService"):Create(instance, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {BackgroundTransparency = value}):Play();
		end

		if instance:IsA("ImageButton") then
			game:GetService("TweenService"):Create(instance, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {ImageTransparency = value}):Play();
		end
	end

	local function HideAllFrames(frame)
		for _,x in pairs(tab_frames:GetChildren()) do
			if x:IsA("ScrollingFrame") and x ~= frame and x.Visible == true then
				for _,obj in pairs(x:GetChildren()) do
					ChangeTransparency(obj, 1);

					if obj:IsA("TextButton") then
						for _,btn_obj in pairs(obj:GetChildren()) do
							if btn_obj:IsA("TextLabel") then
								ChangeTransparency(btn_obj, 1);
							end
						end
					elseif obj:IsA("Frame") then
						for _,frame_obj in pairs(obj:GetChildren()) do
							if frame_obj:IsA("TextButton") then
								for _,btn_obj2 in pairs(frame_obj:GetChildren()) do
									if btn_obj2:IsA("Frame") then
										ChangeTransparency(btn_obj2, 1);

										for _,frame_obj2 in pairs(btn_obj2:GetChildren()) do
											if frame_obj2:IsA("TextButton") then
												ChangeTransparency(frame_obj2, 1);
											end
										end
									end
								end
							elseif frame_obj:IsA("ImageButton") or frame_obj:IsA("TextBox") then
								ChangeTransparency(frame_obj, 1);
							elseif frame_obj:IsA("Frame") then
								ChangeTransparency(frame_obj, 1);

								for _,frame_obj3 in pairs(frame_obj:GetChildren()) do
									if frame_obj3:IsA("TextButton") then
										ChangeTransparency(frame_obj3, 1);
									end
								end
							end
						end
					end
				end
				
				for _,frames in pairs(tab_frames:GetChildren()) do
					if frames:IsA("ScrollingFrame") then
						for _,dr_cs1 in pairs(frames:GetChildren()) do
							if dr_cs1:IsA("Frame") then
								if dr_cs1:FindFirstChild("dropdown_btn") ~= nil and dr_cs1:FindFirstChild("dropdown_btn"):FindFirstChild("Dropdown") ~= nil and dr_cs1:FindFirstChild("dropdown_btn"):FindFirstChild("Dropdown").Visible == true then
									dr_cs1:FindFirstChild("dropdown_btn"):FindFirstChild("dropdown_icon").Rotation = 0;
									dr_cs1:FindFirstChild("dropdown_btn"):FindFirstChild("Dropdown").Size = UDim2.fromScale(1, 0);
									dr_cs1:FindFirstChild("dropdown_btn"):FindFirstChild("Dropdown").Visible = false;
									dr_cs1:FindFirstChild("dropdown_btn").ZIndex = 1;
								elseif dr_cs1:FindFirstChild("keybind_settings") ~= nil and dr_cs1:FindFirstChild("keybind_settings"):FindFirstChild("Settings") ~= nil and dr_cs1:FindFirstChild("keybind_settings"):FindFirstChild("Settings").Visible == true then
									dr_cs1:FindFirstChild("keybind_settings"):FindFirstChild("Settings").Size = UDim2.fromScale(0, 0);
									dr_cs1:FindFirstChild("keybind_settings"):FindFirstChild("Settings").Position = UDim2.fromScale(1.5, -0.6);
									dr_cs1:FindFirstChild("keybind_settings"):FindFirstChild("Settings").Visible = false;
									dr_cs1:FindFirstChild("keybind_settings"):FindFirstChild("Settings").ZIndex = 1;
								end
							end
						end
					end
				end
				
				x:TweenPosition(UDim2.fromScale(0, 0.9), Enum.EasingDirection.Out, Enum.EasingStyle.Sine, 0.5, true, nil);
				x.Visible = false;
				x.ScrollBarImageTransparency = 1;
				
				game:GetService("TweenService"):Create(tabs_main_frame:FindFirstChild(x.Name), TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {BackgroundColor3 = Color3.fromRGB(24, 24, 24), TextColor3 = Color3.fromRGB(200, 200, 200), TextStrokeTransparency = 1}):Play();
				game:GetService("TweenService"):Create(tabs_main_frame:FindFirstChild(x.Name):FindFirstChildOfClass("UIStroke"), TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Transparency = 1}):Play();
			end
		end
	end

	local function ShowFrame(frame)
		if frame:IsA("ScrollingFrame") then
			frame.CanvasPosition = Vector2.new(0, 0);
		end
		frame.Visible = true;
		
		for _,obj in pairs(frame:GetChildren()) do
			if obj:IsA("TextButton") then
				ChangeTransparency(obj, 0);
				
				for _,btn_obj in pairs(obj:GetChildren()) do
					if btn_obj:IsA("TextLabel") then
						ChangeTransparency(btn_obj, 0);
					end
				end
			elseif obj:IsA("Frame") then
				ChangeTransparency(obj, 0);
				
				for _,frame_obj in pairs(obj:GetChildren()) do
					if frame_obj:IsA("TextLabel") or frame_obj:IsA("ImageButton") or frame_obj:IsA("TextBox") then
						ChangeTransparency(frame_obj, 0);
					elseif frame_obj:IsA("TextButton") then
						ChangeTransparency(frame_obj, 0);
						
						for _,btn_obj2 in pairs(frame_obj:GetChildren()) do
							if btn_obj2:IsA("Frame") then
								ChangeTransparency(btn_obj2, 0);

								for _,frame_obj2 in pairs(btn_obj2:GetChildren()) do
									if frame_obj2:IsA("TextButton") then
										ChangeTransparency(frame_obj2, 0);
									end
								end
							end
						end
					elseif frame_obj:IsA("Frame") then
						ChangeTransparency(frame_obj, 0);

						for _,frame_obj3 in pairs(frame_obj:GetChildren()) do
							if frame_obj3:IsA("TextButton") then
								ChangeTransparency(frame_obj3, 0);
							end
						end
					end
				end
			end
		end
		
		frame:TweenPosition(UDim2.fromScale(0.01, 0.01), Enum.EasingDirection.Out, Enum.EasingStyle.Sine, 0.5, true, nil);
	end

	local function HideSettings()
		for _,obj in pairs(settings_main_frame:GetChildren()) do
			if obj:IsA("TextButton") then
				ChangeTransparency(obj, 1);

				for _,btn_obj in pairs(obj:GetChildren()) do
					if btn_obj:IsA("TextLabel") then
						ChangeTransparency(btn_obj, 1);
					end
				end
			elseif obj:IsA("Frame") then
				ChangeTransparency(obj, 1);

				for _,frame_obj in pairs(obj:GetChildren()) do
					if frame_obj:IsA("TextLabel") or frame_obj:IsA("ImageButton") or frame_obj:IsA("TextBox") then
						ChangeTransparency(frame_obj, 1);
					elseif frame_obj:IsA("TextButton") then
						ChangeTransparency(frame_obj, 1);

						for _,btn_obj2 in pairs(frame_obj:GetChildren()) do
							if btn_obj2:IsA("Frame") then
								game:GetService("TweenService"):Create(btn_obj2, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {BackgroundTransparency = 1}):Play();

								for _,frame_obj2 in pairs(btn_obj2:GetChildren()) do
									if frame_obj2:IsA("TextButton") then
										game:GetService("TweenService"):Create(frame_obj2, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {BackgroundTransparency = 1}):Play();
										game:GetService("TweenService"):Create(frame_obj2, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {TextTransparency = 1}):Play();
									end
								end
							end
						end
					elseif frame_obj:IsA("Frame") then
						gChangeTransparency(frame_obj, 1);

						for _,frame_obj3 in pairs(frame_obj:GetChildren()) do
							if frame_obj3:IsA("TextButton") then
								ChangeTransparency(frame_obj3, 1);
							end
						end
					end
				end
			end
		end
		
		settings_main_frame:TweenPosition(UDim2.fromScale(0, 0.9), Enum.EasingDirection.Out, Enum.EasingStyle.Sine, 0.5, true, nil);
		settings_frame.Visible = false;
		settings_main_frame.Visible = false;
	end

	settings_button.MouseButton1Click:Connect(function()
		if not settings_frame.Visible then
			HideAllFrames(settings_frame);
			settings_frame.Visible = true;
			ShowFrame(settings_main_frame);

			settings_main_frame.Visible = true;
		end
	end)
	
	--[[ Settings ]]
	
	local settings_key_event_con1 = nil;
	local settings_key_event_con2 = nil;
	local settings_editing_key = false;
	local settings_key_value = nil;
	local settings_keybind_mainevent = nil;
	local settings_key_settings_status = false;
	local menu_toggled = false;
	local keybind_debounce = false;

	local oc_menu_btn = Instance.new("Frame");
	oc_menu_btn.BackgroundColor3 = Color3.fromRGB(17, 17, 17);
	oc_menu_btn.Name = "Menu_Keybind";
	oc_menu_btn.Position = UDim2.fromScale(0, 0);
	oc_menu_btn.Size = UDim2.fromScale(0.95, 0.063);
	oc_menu_btn.Transparency = 1;
	oc_menu_btn.Visible = true;
	oc_menu_btn.BackgroundTransparency = 0;
	oc_menu_btn.BorderSizePixel = 0;
	oc_menu_btn.ZIndex = 2;
	oc_menu_btn.Parent = settings_main_frame;

	local ui_c = Instance.new("UICorner");
	ui_c.CornerRadius = UDim.new(0, 6);
	ui_c.Parent = oc_menu_btn;

	local ui_stroke = Instance.new("UIStroke");
	ui_stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
	ui_stroke.Color = Color3.fromRGB(38, 38, 38);
	ui_stroke.LineJoinMode = Enum.LineJoinMode.Round;
	ui_stroke.Thickness = 1;
	ui_stroke.Transparency = 0;
	ui_stroke.Parent = oc_menu_btn;

	local kbt = Instance.new("TextLabel");
	kbt.BackgroundTransparency = 1;
	kbt.Name = "Title";
	kbt.Size = UDim2.fromScale(0.457, 0.75);
	kbt.Position = UDim2.fromScale(0.025, 0.15);
	kbt.Visible = true;
	kbt.Active = false;
	kbt.Text = "Toggle Menu";
	kbt.TextScaled = true;
	kbt.TextColor3 = Color3.fromRGB(255, 255, 255);
	kbt.Font = Enum.Font.Gotham;
	kbt.TextXAlignment = Enum.TextXAlignment.Left;
	kbt.Parent = oc_menu_btn;

	local kb = Instance.new("TextButton");
	kb.BackgroundTransparency = 0;
	kb.BackgroundColor3 = Color3.fromRGB(48, 48, 48);
	kb.Name = "Keybind";
	kb.Position = UDim2.fromScale(0.825, 0.075);
	kb.Size = UDim2.fromScale(0.15, 0.85);
	kb.Visible = true;
	kb.Text = "None";
	kb.TextColor3 = Color3.fromRGB(255, 255, 255);
	kb.Font = Enum.Font.Gotham;
	kb.TextScaled = true;
	kb.TextStrokeTransparency = 1;
	kb.AutoButtonColor = false;
	kb.Parent = oc_menu_btn;

	kb.MouseButton1Click:Connect(function()
		settings_editing_key = not settings_editing_key;
		
		if settings_editing_key then
			local old_key = kb.Text;
			local old_key_val = settings_key_value;

			kb.Text = "";
			settings_key_value = nil;

			settings_keybind_mainevent = game:GetService("UserInputService").InputEnded:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.Keyboard then
					if input.KeyCode == Enum.KeyCode.Escape then
						kb.Text = old_key;
						settings_key_value = old_key_val;
						settings_keybind_mainevent:Disconnect();
					else
						if input.KeyCode ~= nil and game:GetService("UserInputService"):GetStringForKeyCode(input.KeyCode) ~= "" and string.byte(tostring(game:GetService("UserInputService"):GetStringForKeyCode(input.KeyCode))) ~= nil then
							settings_key_value = tonumber(string.byte(tostring(game:GetService("UserInputService"):GetStringForKeyCode(input.KeyCode))));
							kb.Text = tostring(game:GetService("UserInputService"):GetStringForKeyCode(input.KeyCode));
							keybind_debounce = true;

							task.spawn(delay, 0.5, function()
								keybind_debounce = false;
							end)

							settings_keybind_mainevent:Disconnect();
						else
							kb.Text = "None";
							settings_key_value = nil;
							settings_keybind_mainevent:Disconnect();
						end
					end
				end
			end)
		elseif not settings_editing_key then
			if settings_keybind_mainevent ~= nil then
				settings_keybind_mainevent:Disconnect();
			end
			kb.Text = "None";
			settings_key_value = nil;
		end
	end)

	settings_key_event_con1 = game:GetService("UserInputService").InputEnded:Connect(function(input, processed)
		if not gui.Parent or gui == nil then
		    settings_key_event_con1:Disconnect();
		end
		
		if not processed then
			if settings_key_value ~= nil then
				if input.UserInputType == Enum.UserInputType.Keyboard then
					if input.KeyCode ~= nil and game:GetService("UserInputService"):GetStringForKeyCode(input.KeyCode) ~= "" and tonumber(string.byte(tostring(game:GetService("UserInputService"):GetStringForKeyCode(input.KeyCode)))) == tonumber(settings_key_value) then
						if not keybind_debounce then
							menu_toggled = not menu_toggled;
							keybind_debounce = true;
							
							task.spawn(function()
								if menu_toggled then
									for _,x in pairs(tab_frames:GetChildren()) do
										if x:IsA("ScrollingFrame") then
											for _,obj in pairs(x:GetChildren()) do
												ChangeTransparency(obj, 1);
												
												if obj:IsA("TextButton") then
													for _,btn_obj in pairs(obj:GetChildren()) do
														if btn_obj:IsA("TextLabel") then
															ChangeTransparency(btn_obj, 1);
														end
													end
												elseif obj:IsA("Frame") then
													ChangeTransparency(obj, 1);

													for _,frame_obj in pairs(obj:GetChildren()) do
														if frame_obj:IsA("TextLabel") or frame_obj:IsA("ImageButton") or frame_obj:IsA("TextBox") then
															ChangeTransparency(frame_obj, 1);
														elseif frame_obj:IsA("TextButton") then
															ChangeTransparency(frame_obj, 1);

															for _,btn_obj2 in pairs(frame_obj:GetChildren()) do
																if btn_obj2:IsA("Frame") then
																	ChangeTransparency(obj, 1);

																	for _,frame_obj2 in pairs(btn_obj2:GetChildren()) do
																		if frame_obj2:IsA("TextButton") then
																			ChangeTransparency(obframe_obj2j, 1);
																		end
																	end
																end
															end
														elseif frame_obj:IsA("Frame") then
															for _,frame_obj3 in pairs(frame_obj:GetChildren()) do
																if frame_obj3:IsA("TextButton") then
																	ChangeTransparency(frame_obj3, 1);
																end
															end
														end
													end
												end
											end
										end
									end
									
									for _,tab in pairs(tabs_main_frame:GetChildren()) do
										if tab:IsA("TextButton") then
											game:GetService("TweenService"):Create(tab, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {TextTransparency = 1, BackgroundTransparency = 1}):Play();
										end
									end

									game:GetService("TweenService"):Create(main_frame, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {BackgroundTransparency = 1}):Play();
									game:GetService("TweenService"):Create(tabs_frame, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {ImageTransparency = 1}):Play();

									main_frame:TweenSizeAndPosition(UDim2.fromScale(0.001, 0.001), UDim2.new(0.51, main_frame.Position.X.Offset, 0.489, main_frame.Position.Y.Offset), Enum.EasingDirection.Out, Enum.EasingStyle.Sine, 0.5, true, nil);
								else
									for _,x in pairs(tab_frames:GetChildren()) do
										if x:IsA("ScrollingFrame") then
											for _,obj in pairs(x:GetChildren()) do
												if obj:IsA("TextButton") then
													ChangeTransparency(obj, 0);

													for _,btn_obj in pairs(obj:GetChildren()) do
														if btn_obj:IsA("TextLabel") then
															ChangeTransparency(btn_obj, 0);
														end
													end
												elseif obj:IsA("Frame") then
													ChangeTransparency(obj, 0);

													for _,frame_obj in pairs(obj:GetChildren()) do
														if frame_obj:IsA("TextLabel") or frame_obj:IsA("ImageButton") or frame_obj:IsA("TextBox") then
															ChangeTransparency(frame_obj, 0);
														elseif frame_obj:IsA("TextButton") then
															ChangeTransparency(frame_obj, 0);

															for _,btn_obj2 in pairs(frame_obj:GetChildren()) do
																if btn_obj2:IsA("Frame") then
																	ChangeTransparency(btn_obj2, 0);

																	for _,frame_obj2 in pairs(btn_obj2:GetChildren()) do
																		if frame_obj2:IsA("TextButton") then
																			ChangeTransparency(frame_obj2, 0);
																		end
																	end
																end
															end
														elseif frame_obj:IsA("Frame") then
															ChangeTransparency(frame_obj, 0);

															for _,frame_obj3 in pairs(frame_obj:GetChildren()) do
																if frame_obj3:IsA("TextButton") then
																	ChangeTransparency(frame_obj3, 0);
																end
															end
														end
													end
												end
											end
										end
									end
									
									for _,tab in pairs(tabs_main_frame:GetChildren()) do
										if tab:IsA("TextButton") then
											game:GetService("TweenService"):Create(tab, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {TextTransparency = 0, BackgroundTransparency = 0}):Play();
										end
									end

									game:GetService("TweenService"):Create(main_frame, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {BackgroundTransparency = 0}):Play();
									game:GetService("TweenService"):Create(tabs_frame, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {ImageTransparency = 0}):Play();

									main_frame:TweenSizeAndPosition(UDim2.fromScale(0.29, 0.338), UDim2.new(0.367, main_frame.Position.X.Offset, 0.329, main_frame.Position.Y.Offset), Enum.EasingDirection.Out, Enum.EasingStyle.Sine, 0.5, true, nil);
								end
							end)
							
							task.spawn(delay, 0.5, function()
								keybind_debounce = false;
							end)
						end
					end
				end
			end
		end
	end)
	
	local di_btn = Instance.new("TextButton");
	di_btn.Active = true;
	di_btn.BackgroundColor3 = Color3.fromRGB(17, 17, 17);
	di_btn.Name = "Join_DS";
	di_btn.Position = UDim2.fromScale(0, 0);
	di_btn.Size = UDim2.fromScale(0.95, 0.063);
	di_btn.Text = "";
	di_btn.Transparency = 1;
	di_btn.Style = Enum.ButtonStyle.Custom;
	di_btn.Visible = true;
	di_btn.AutoButtonColor = false;
	di_btn.Font = Enum.Font.SourceSans;
	di_btn.BackgroundTransparency = 0;
	di_btn.BorderSizePixel = 0;
	di_btn.ZIndex = 2;
	di_btn.ClipsDescendants = true;
	di_btn.Parent = settings_main_frame;

	local ui_c = Instance.new("UICorner");
	ui_c.CornerRadius = UDim.new(0, 6);
	ui_c.Parent = di_btn;

	local ui_stroke = Instance.new("UIStroke");
	ui_stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
	ui_stroke.Color = Color3.fromRGB(38, 38, 38);
	ui_stroke.LineJoinMode = Enum.LineJoinMode.Round;
	ui_stroke.Thickness = 1;
	ui_stroke.Transparency = 0;
	ui_stroke.Parent = di_btn;

	local di_btn_title = Instance.new("TextLabel");
	di_btn_title.BackgroundTransparency = 1;
	di_btn_title.Name = "Title";
	di_btn_title.Size = UDim2.fromScale(0.945, 0.75);
	di_btn_title.Position = UDim2.fromScale(0.025, 0.15);
	di_btn_title.Visible = true;
	di_btn_title.Active = false;
	di_btn_title.Text = "Join Discord Server";
	di_btn_title.TextScaled = true;
	di_btn_title.TextColor3 = Color3.fromRGB(255, 255, 255);
	di_btn_title.Font = Enum.Font.Gotham;
	di_btn_title.TextXAlignment = Enum.TextXAlignment.Left;
	di_btn_title.Parent = di_btn;

	di_btn.MouseButton1Click:Connect(function()
		coroutine.resume(coroutine.create(function()	
			local http_request = (syn ~= nil or is_syn_closure) and syn.request or (is_fluxus_closure or is_sentinel_closure or is_krnl_closure or is_electron_closure) and request or httpRequest;
			
			http_request({
   				Url = "http://127.0.0.1:6463/rpc?v=1",
   				Method = "POST",
   				Headers = {
       				["Content-Type"] = "application/json",
       				["Origin"] = "https://discord.com"
   				},
   				Body = game:GetService("HttpService"):JSONEncode({
       				cmd = "INVITE_BROWSER",
       				args = {
           				code = "AZU2zmGf9a"
       				},
       				nonce = game:GetService("HttpService"):GenerateGUID(false)
   				}),
			});
		end));
				
		coroutine.resume(coroutine.create(function()
			local ripple_image = Instance.new("ImageLabel");
			ripple_image.Active = false;
			ripple_image.Visible = true;
			ripple_image.Name = "0";
			ripple_image.Image = "http://www.roblox.com/asset/?id=4560909609";
			ripple_image.ImageTransparency = 0.1;
			ripple_image.Size = UDim2.fromScale(0, 0);
			ripple_image.Position = UDim2.fromScale(0, 0);
			ripple_image.ZIndex = 1;
			ripple_image.BackgroundTransparency = 1;
			ripple_image.ImageColor3 = Color3.fromRGB(80, 80, 80);
			ripple_image.ScaleType = Enum.ScaleType.Stretch;
			ripple_image.SliceScale = 1;
			ripple_image.ClipsDescendants = true;
			ripple_image.Parent = di_btn;

			local x, y = (game:GetService("Players").LocalPlayer:GetMouse().X - ripple_image.AbsolutePosition.X), (game:GetService("Players").LocalPlayer:GetMouse().Y - ripple_image.AbsolutePosition.Y);
			ripple_image.Position = UDim2.new(0, x, 0, y);

			local len, size = 0.65, nil;
			if di_btn.AbsoluteSize.X >= di_btn.AbsoluteSize.Y then
				size = (di_btn.AbsoluteSize.X * 1.5);
			else
				size = (di_btn.AbsoluteSize.Y * 1.5);
			end

			ripple_image:TweenSizeAndPosition(UDim2.new(0, size, 0, size), UDim2.new(0.5, (-size / 2), 0.5, (-size / 2)), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, len, true, nil);
			local tween = game:GetService("TweenService"):Create(ripple_image, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {ImageTransparency = 1})
			tween:Play();
			tween.Completed:Wait();

			ripple_image:Destroy();
		end))
	end)
	
	--[[ Settings ]]
	
	function gui_funcs:NewTab(name)
		if tostring(name) == nil then return error("[dizzy hub] Tab's name is undefined.") end
		for i,tabs in pairs(tabs_main_frame:GetChildren()) do if tabs:IsA("Frame") then if i >= 7 then return error("[dizzy hub] Can't create tabs more than 7."); end end end

		local btn = Instance.new("TextButton");
		btn.Active = true;
		btn.AutoButtonColor = false;
		btn.BackgroundColor3 = Color3.fromRGB(24, 24, 24);
		btn.BackgroundTransparency = 0;
		btn.Name = tostring(name);
		btn.Text = tostring(name);
		btn.Style = Enum.ButtonStyle.Custom;
		btn.TextSize = 15;
		btn.Font = Enum.Font.Gotham;
		btn.BorderSizePixel = 0;
		btn.TextColor3 = Color3.fromRGB(200, 200, 200);
		btn.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
		btn.TextStrokeTransparency = 1;
		btn.Size = UDim2.fromScale(0.86, 0.11);
		btn.Visible = true;
		btn.Parent = tabs_main_frame;

		local ui_stroke = Instance.new("UIStroke");
		ui_stroke.Color = Color3.fromRGB(150, 150, 150);
		ui_stroke.LineJoinMode = Enum.LineJoinMode.Round;
		ui_stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
		ui_stroke.Thickness = 1.5;
		ui_stroke.Transparency = 1;
		ui_stroke.Parent = btn;

		local ui_gradient = Instance.new("UIGradient");
		ui_gradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255)), ColorSequenceKeypoint.new(1, Color3.fromRGB(255, 255, 255))};
		ui_gradient.Rotation = 0;
		ui_gradient.Transparency = NumberSequence.new{
			NumberSequenceKeypoint.new(0, 0.9),
			NumberSequenceKeypoint.new(0.1, 0.7),
			NumberSequenceKeypoint.new(0.2, 0.5),
			NumberSequenceKeypoint.new(0.8, 0.5),
			NumberSequenceKeypoint.new(0.9, 0.7),
			NumberSequenceKeypoint.new(1, 0.9),
		};
		ui_gradient.Parent = ui_stroke;

		local ui_c = Instance.new("UICorner");
		ui_c.CornerRadius = UDim.new(0, 8);
		ui_c.Parent = btn;

		local frame = Instance.new("ScrollingFrame");
		frame.BackgroundTransparency = 1;
		frame.Position = UDim2.fromScale(0, 0.9);
		frame.Size = UDim2.fromScale(0.99, 0.99);
		frame.Visible = false;
		frame.CanvasSize = UDim2.fromScale(0, 0.9);
		frame.CanvasPosition = Vector2.new(0, 0);
		frame.ScrollBarImageColor3 = Color3.fromRGB(56, 56, 56);
		frame.ScrollBarThickness = 6;
		frame.ScrollBarImageTransparency = 1;
		frame.ScrollingDirection = Enum.ScrollingDirection.Y;
		frame.MidImage = "rbxasset://textures/ui/Scroll/scroll-middle.png";
		frame.TopImage = "rbxasset://textures/ui/Scroll/scroll-top.png";
		frame.BottomImage = "rbxasset://textures/ui/Scroll/scroll-bottom.png";
		frame.Name = tostring(name);
		frame.ZIndex = 3;
		frame.BorderSizePixel = 0;
		frame.ClipsDescendants = false;
		frame.Parent = tab_frames;

		local ui_list_layout = Instance.new("UIListLayout");
		ui_list_layout.FillDirection = Enum.FillDirection.Vertical;
		ui_list_layout.HorizontalAlignment = Enum.HorizontalAlignment.Left;
		ui_list_layout.SortOrder = Enum.SortOrder.LayoutOrder;
		ui_list_layout.VerticalAlignment = Enum.VerticalAlignment.Top;
		ui_list_layout.Padding = UDim.new(0, 7);
		ui_list_layout.Parent = frame;

		btn.MouseButton1Click:Connect(function()
			if not frame.Visible then
				if settings_frame.Visible then
					HideSettings();
				end
			
				HideAllFrames(frame);
				
				game:GetService("TweenService"):Create(ui_stroke, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Transparency = 0}):Play();
				game:GetService("TweenService"):Create(btn, TweenInfo.new(0.5, Enum.EasingStyle.Sine, Enum.EasingDirection.In), {BackgroundColor3 = Color3.fromRGB(12, 12, 12), TextColor3 = Color3.fromRGB(255, 255, 255), TextStrokeTransparency = 0.8}):Play();

				ShowFrame(frame);
			end
		end)
		
		frame.Changed:Connect(function()
		    local canvas_size = (((#frame:GetChildren() + 1) / 10) * 1.1 > 1 and ((#frame:GetChildren() + 1) / 10) * 1.1 or 1);
    		frame.CanvasSize = UDim2.fromScale(0, canvas_size);

		    local element_size = 0.0945;
    
    		for _,element in pairs(frame:GetChildren()) do
    		    if element:IsA("Frame") or element:IsA("ScrollingFrame") or element:IsA("TextButton") then
			    	element.Size = UDim2.fromScale(element.Size.X.Scale, element_size / canvas_size);
    		    end
    		end
		end)

		local tab_funcs = {}

		function tab_funcs:NewButton(name, action)
			if tostring(name) == nil then return error("[dizzy hub] Button's name is undefined. (name: "..tostring(name).." )") end

			local tab_btn = Instance.new("TextButton");
			tab_btn.Active = true;
			tab_btn.BackgroundColor3 = Color3.fromRGB(17, 17, 17);
			tab_btn.Name = tostring(name);
			tab_btn.Position = UDim2.fromScale(0, 0);
			tab_btn.Size = UDim2.fromScale(0.965, 0.063);
			tab_btn.Text = "";
			tab_btn.TextTransparency = 1;
			tab_btn.Style = Enum.ButtonStyle.Custom;
			tab_btn.Visible = true;
			tab_btn.AutoButtonColor = false;
			tab_btn.Font = Enum.Font.SourceSans;
			tab_btn.BackgroundTransparency = 0;
			tab_btn.BorderSizePixel = 0;
			tab_btn.ZIndex = 2;
			tab_btn.ClipsDescendants = true;
			tab_btn.Parent = frame;

			local ui_stroke = Instance.new("UIStroke");
			ui_stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
			ui_stroke.Color = Color3.fromRGB(38, 38, 38);
			ui_stroke.LineJoinMode = Enum.LineJoinMode.Round;
			ui_stroke.Thickness = 1;
			ui_stroke.Transparency = 0;
			ui_stroke.Parent = tab_btn;

			local ui_c = Instance.new("UICorner");
			ui_c.CornerRadius = UDim.new(0, 6);
			ui_c.Parent = tab_btn;

			local btn_title = Instance.new("TextLabel");
			btn_title.BackgroundTransparency = 1;
			btn_title.Name = "Title";
			btn_title.Size = UDim2.fromScale(0.945, 0.75);
			btn_title.Position = UDim2.fromScale(0.025, 0.15);
			btn_title.Visible = true;
			btn_title.Active = false;
			btn_title.Text = tostring(name);
			btn_title.TextScaled = true;
			btn_title.TextColor3 = Color3.fromRGB(255, 255, 255);
			btn_title.Font = Enum.Font.Gotham;
			btn_title.TextXAlignment = Enum.TextXAlignment.Left;
			btn_title.Parent = tab_btn;

			tab_btn.MouseButton1Click:Connect(function()
				task.spawn(action);

				coroutine.resume(coroutine.create(function()
					local ripple_image = Instance.new("ImageLabel");
					ripple_image.Active = false;
					ripple_image.Visible = true;
					ripple_image.Name = "0";
					ripple_image.Image = "http://www.roblox.com/asset/?id=4560909609";
					ripple_image.ImageTransparency = 0.1;
					ripple_image.Size = UDim2.fromScale(0, 0);
					ripple_image.Position = UDim2.fromScale(0, 0);
					ripple_image.ZIndex = 1;
					ripple_image.BackgroundTransparency = 1;
					ripple_image.ImageColor3 = Color3.fromRGB(80, 80, 80);
					ripple_image.ScaleType = Enum.ScaleType.Stretch;
					ripple_image.SliceScale = 1;
					ripple_image.ClipsDescendants = true;
					ripple_image.Parent = tab_btn;

					local x, y = (game:GetService("Players").LocalPlayer:GetMouse().X - ripple_image.AbsolutePosition.X), (game:GetService("Players").LocalPlayer:GetMouse().Y - ripple_image.AbsolutePosition.Y);
					ripple_image.Position = UDim2.new(0, x, 0, y);

					local len, size = 0.65, nil;

					if tab_btn.AbsoluteSize.X >= tab_btn.AbsoluteSize.Y then
						size = (tab_btn.AbsoluteSize.X * 1.5);
					else
						size = (tab_btn.AbsoluteSize.Y * 1.5);
					end

					ripple_image:TweenSizeAndPosition(UDim2.new(0, size, 0, size), UDim2.new(0.5, (-size / 2), 0.5, (-size / 2)), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, len, true, nil);
					local tween = game:GetService("TweenService"):Create(ripple_image, TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {ImageTransparency = 1})
					tween:Play();
					tween.Completed:Wait();
					ripple_image:Destroy();
				end))
			end)
		end
		
		function tab_funcs:NewCheckbox(name, action)
			if tostring(name) == nil then return error("[dizzy hub] Checkbox's name is undefined. (name: "..tostring(name).." )") end
			
			local toggled = false;
			
			local tab_btn = Instance.new("Frame");
			tab_btn.BackgroundColor3 = Color3.fromRGB(17, 17, 17);
			tab_btn.Name = tostring(name);
			tab_btn.Position = UDim2.fromScale(0, 0);
			tab_btn.Size = UDim2.fromScale(0.965, 0.063);
			tab_btn.Transparency = 1;
			tab_btn.Visible = true;
			tab_btn.BackgroundTransparency = 0;
			tab_btn.BorderSizePixel = 0;
			tab_btn.ZIndex = 2;
			tab_btn.Parent = frame;

			local ui_stroke = Instance.new("UIStroke");
			ui_stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
			ui_stroke.Color = Color3.fromRGB(38, 38, 38);
			ui_stroke.LineJoinMode = Enum.LineJoinMode.Round;
			ui_stroke.Thickness = 1;
			ui_stroke.Transparency = 0;
			ui_stroke.Parent = tab_btn;

			local ui_c = Instance.new("UICorner");
			ui_c.CornerRadius = UDim.new(0, 6);
			ui_c.Parent = tab_btn;

			local btn_title = Instance.new("TextLabel");
			btn_title.BackgroundTransparency = 1;
			btn_title.Name = "Title";
			btn_title.Size = UDim2.fromScale(0.875, 0.75);
			btn_title.Position = UDim2.fromScale(0.085, 0.1);
			btn_title.Visible = true;
			btn_title.Active = false;
			btn_title.Text = tostring(name);
			btn_title.TextScaled = true;
			btn_title.TextColor3 = Color3.fromRGB(255, 255, 255);
			btn_title.Font = Enum.Font.Gotham;
			btn_title.TextXAlignment = Enum.TextXAlignment.Left;
			btn_title.Parent = tab_btn;
			
			local untoggled_image = Instance.new("ImageButton");
			untoggled_image.Active = true;
			untoggled_image.BackgroundTransparency = 1;
			untoggled_image.Position = UDim2.fromScale(0.02, 0.15);
			untoggled_image.Size = UDim2.fromScale(0.0505, 0.7);
			untoggled_image.Visible = true;
			untoggled_image.Image = "http://www.roblox.com/asset/?id=14596065772";
			untoggled_image.ImageTransparency = 0;
			untoggled_image.ImageColor3 = Color3.fromRGB(255, 255, 255);
			untoggled_image.Name = "untoggled";
			untoggled_image.ScaleType = Enum.ScaleType.Stretch;
			untoggled_image.SliceScale = 1;
			untoggled_image.Parent = tab_btn;

			local ui_gradient = Instance.new("UIGradient");
			ui_gradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0, Color3.fromRGB(56, 56, 56)), ColorSequenceKeypoint.new(1, Color3.fromRGB(80, 80, 80))};
			ui_gradient.Rotation = 90;
			ui_gradient.Parent = untoggled_image;
			
			local toggled_image = Instance.new("ImageButton");
			toggled_image.Active = true;
			toggled_image.BackgroundTransparency = 1;
			toggled_image.Position = UDim2.fromScale(0.02, 0.15);
			toggled_image.Size = UDim2.fromScale(0.0505, 0.7);
			toggled_image.Visible = false;
			toggled_image.Image = "rbxassetid://1264515756";
			toggled_image.ImageTransparency = 1;
			toggled_image.ImageColor3 = Color3.fromRGB(255, 255, 255);
			toggled_image.Name = "toggled";
			toggled_image.ScaleType = Enum.ScaleType.Stretch;
			toggled_image.SliceScale = 1;
			toggled_image.Parent = tab_btn;
				
			untoggled_image.MouseButton1Click:Connect(function()
				toggled = true;
				task.spawn(action, toggled)
				
				local tween1 = game:GetService("TweenService"):Create(untoggled_image, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {ImageTransparency = 1});
				local tween2 = game:GetService("TweenService"):Create(toggled_image, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {ImageTransparency = 0});
				
				tween1:Play();
				toggled_image.Visible = true;
				tween2:Play();
				tween1.Completed:Wait();
				untoggled_image.Visible = false;
			end)
			
			toggled_image.MouseButton1Click:Connect(function()
				toggled = false;

				task.spawn(action, toggled)
				
				local tween1 = game:GetService("TweenService"):Create(untoggled_image, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {ImageTransparency = 0});
				local tween2 = game:GetService("TweenService"):Create(toggled_image, TweenInfo.new(0.1, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {ImageTransparency = 1});
				
				untoggled_image.Visible = true;
				tween1:Play();
				tween1.Completed:Wait();
				
				tween2:Play();
				tween2.Completed:Wait();
				toggled_image.Visible = false;
			end)
		end
		
		function tab_funcs:NewSlider(name, min, max, precise, action)
			if tostring(name) == nil then return error("[dizzy hub] Sliders's name is undefined. (name: "..tostring(name).." )") end
			if tonumber(min) == nil then return error("[dizzy hub] Minimal value is undefined. (name: "..tostring(name).." )") end
			if tonumber(max) == nil then return error("[dizzy hub] Maximum value is undefined. (name: "..tostring(name).." )") end
			
			local holding_slider = false;
			local slider_connection = nil;
			
			local tab_btn = Instance.new("Frame");
			tab_btn.BackgroundColor3 = Color3.fromRGB(17, 17, 17);
			tab_btn.Name = tostring(name);
			tab_btn.Position = UDim2.fromScale(0, 0.149);
			tab_btn.Size = UDim2.fromScale(0.965, 0.063);
			tab_btn.Transparency = 1;
			tab_btn.Visible = true;
			tab_btn.BackgroundTransparency = 0;
			tab_btn.BorderSizePixel = 0;
			tab_btn.ZIndex = 2;
			tab_btn.Parent = frame;

			local ui_stroke = Instance.new("UIStroke");
			ui_stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
			ui_stroke.Color = Color3.fromRGB(38, 38, 38);
			ui_stroke.LineJoinMode = Enum.LineJoinMode.Round;
			ui_stroke.Thickness = 1;
			ui_stroke.Transparency = 0;
			ui_stroke.Parent = tab_btn;

			local ui_c = Instance.new("UICorner");
			ui_c.CornerRadius = UDim.new(0, 6);
			ui_c.Parent = tab_btn;
			
			local btn_title = Instance.new("TextLabel");
			btn_title.BackgroundTransparency = 1;
			btn_title.Name = "Title";
			btn_title.Size = UDim2.fromScale(0.35, 0.75);
			btn_title.Position = UDim2.fromScale(0.025, 0.15);
			btn_title.Visible = true;
			btn_title.Active = false;
			btn_title.Text = tostring(name);
			btn_title.TextScaled = true;
			btn_title.TextColor3 = Color3.fromRGB(255, 255, 255);
			btn_title.Font = Enum.Font.Gotham;
			btn_title.TextXAlignment = Enum.TextXAlignment.Left;
			btn_title.Parent = tab_btn;
			
			local slider_frame = Instance.new("Frame");
			slider_frame.BackgroundColor3 = Color3.fromRGB(48, 48, 48);
			slider_frame.BackgroundTransparency = 0;
			slider_frame.BorderSizePixel = 0;
			slider_frame.Position = UDim2.fromScale(0.5, 0.45);
			slider_frame.Size = UDim2.fromScale(0.35, 0.18);
			slider_frame.Visible = true;
			slider_frame.Name = "Slider";
			slider_frame.Parent = tab_btn;

			local slider_handler = Instance.new("TextButton");
			slider_handler.Active = true;
			slider_handler.AutoButtonColor = false;
			slider_handler.BackgroundTransparency = 0;
			slider_handler.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
			slider_handler.BorderSizePixel = 0;
			slider_handler.Name = "button";
			slider_handler.Position = UDim2.fromScale(0, -0.5);
			slider_handler.Size = UDim2.fromScale(0.06, 1.75);
			slider_handler.Visible = true;
			slider_handler.Text = "";
			slider_handler.TextTransparency = 1;
			slider_handler.Parent = slider_frame;

			local ui_c = Instance.new("UICorner");
			ui_c.CornerRadius = UDim.new(0, 16);
			ui_c.Parent = slider_handler;

			local text_box = Instance.new("TextBox");
			text_box.Active = true;
			text_box.BackgroundColor3 = Color3.fromRGB(48, 48, 48);
			text_box.BackgroundTransparency = 0;
			text_box.BorderSizePixel = 0;
			text_box.ClearTextOnFocus = false;
			text_box.Name = "box";
			text_box.Position = UDim2.fromScale(0.9, 0.1);
			text_box.ShowNativeInput = true;
			text_box.Size = UDim2.fromScale(0.0635, 0.8);
			text_box.TextEditable = true;
			text_box.Visible = true;
			text_box.Text = tostring(min);
			text_box.Font = Enum.Font.Gotham;
			text_box.PlaceholderText = "";
			text_box.TextColor3 = Color3.fromRGB(255, 255, 255);
			text_box.TextStrokeTransparency = 1;
			text_box.TextScaled = true;
			text_box.Parent = tab_btn;

			--[[local function snap(n, f)
				if f == 0 then
					return n;
				end

				return math.floor(n/f+0.5)*f;
			end]]

			local function snap(v, s)
				return v - (v % s);
			end
			
			text_box.Changed:Connect(function(p)
				if p == "Text" and game:GetService("UserInputService"):GetFocusedTextBox() == text_box then
					if tonumber(text_box.Text) ~= nil then
						if tonumber(text_box.Text) >= max then
							text_box.TextEditable = false;
							text_box.Text = tostring(max);

							task.spawn(action, tonumber(max));

							slider_handler.Position = UDim2.new(math.clamp(snap(max, max), 0, 1), 0, slider_handler.Position.Y.Scale, slider_handler.Position.Y.Offset);
							text_box.TextEditable = true;
						elseif tonumber(text_box.Text) <= min or tonumber(text_box.Text) == nil then
							text_box.TextEditable = false;
							text_box.Text = tostring(min);

							task.spawn(action, tonumber(min));

							slider_handler.Position = UDim2.new(math.clamp(snap(min, max), 0, 1), 0, slider_handler.Position.Y.Scale, slider_handler.Position.Y.Offset);
							text_box.TextEditable = true;
						else
							task.spawn(action, tonumber(text_box.Text));

							slider_handler.Position = UDim2.new(math.clamp(snap(tonumber(text_box.Text), max), 0, 1), 0, slider_handler.Position.Y.Scale, slider_handler.Position.Y.Offset);
						end
					end
				end
			end)
			
			game:GetService("UserInputService").InputEnded:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					holding_slider = false;
					if slider_connection ~= nil then
						slider_connection:Disconnect();
					end
				end
			end)
			
			slider_handler.MouseButton1Down:Connect(function()
				holding_slider = true;
				slider_connection = game:GetService("RunService").RenderStepped:Connect(function()
					if holding_slider then
						local percentage = math.round(snap(math.clamp((game:GetService("UserInputService"):GetMouseLocation().X - slider_frame.AbsolutePosition.X)/slider_frame.AbsoluteSize.X, 0, 1), 0.02)*100)/100
						slider_handler.Position = UDim2.new(percentage, 0, slider_handler.Position.Y.Scale, slider_handler.Position.Y.Offset);

						local slider_value = percentage * (max - min) + min;
						if not precise then
							slider_value = math.floor(slider_value + 0.5);
						end
						
						text_box.TextEditable = false;

						if slider_value < min then
							text_box.Text = tostring(min);
							task.spawn(action, tonumber(min));
						elseif slider_value > max then
							text_box.Text = tostring(max);
							task.spawn(action, tonumber(max));
						else
							text_box.Text = tostring(slider_value);
							task.spawn(action, tonumber(slider_value));
						end

						text_box.TextEditable = true;
					end
				end)
			end)
		end
		
		function tab_funcs:NewDropdown(name, items, action)
			if tostring(name) == nil then return error("[dizzy hub] Dropdown's name is undefined. (name: "..tostring(name).." )") end
			if items == nil or typeof(items) ~= "table" then return error("[dizzy hub] Dropdown's items are undefined. (name: "..tostring(name).." )") end
			
			local all_elements = nil;
			
			local tab_btn = Instance.new("Frame");
			tab_btn.BackgroundColor3 = Color3.fromRGB(17, 17, 17);
			tab_btn.Name = tostring(name);
			tab_btn.Position = UDim2.fromScale(0, 0.149);
			tab_btn.Size = UDim2.fromScale(0.965, 0.063);
			tab_btn.Transparency = 1;
			tab_btn.Visible = true;
			tab_btn.BackgroundTransparency = 0;
			tab_btn.BorderSizePixel = 0;
			tab_btn.ZIndex = 1;
			tab_btn.Parent = frame;

			local ui_stroke = Instance.new("UIStroke");
			ui_stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
			ui_stroke.Color = Color3.fromRGB(38, 38, 38);
			ui_stroke.LineJoinMode = Enum.LineJoinMode.Round;
			ui_stroke.Thickness = 1;
			ui_stroke.Transparency = 0;
			ui_stroke.Parent = tab_btn;

			local ui_c = Instance.new("UICorner");
			ui_c.CornerRadius = UDim.new(0, 6);
			ui_c.Parent = tab_btn;

			local btn_title = Instance.new("TextLabel");
			btn_title.BackgroundTransparency = 1;
			btn_title.Name = "Title";
			btn_title.Size = UDim2.fromScale(0.35, 0.75);
			btn_title.Position = UDim2.fromScale(0.025, 0.15);
			btn_title.Visible = true;
			btn_title.Active = false;
			btn_title.Text = tostring(name);
			btn_title.TextScaled = true;
			btn_title.TextColor3 = Color3.fromRGB(255, 255, 255);
			btn_title.Font = Enum.Font.Gotham;
			btn_title.TextXAlignment = Enum.TextXAlignment.Left;
			btn_title.Parent = tab_btn;
			
			local dropdown_btn = Instance.new("TextButton");
			dropdown_btn.Active = true;
			dropdown_btn.AutoButtonColor = false;
			dropdown_btn.BackgroundTransparency = 0;
			dropdown_btn.BackgroundColor3 = Color3.fromRGB(48, 48, 48);
			dropdown_btn.BorderColor3 = Color3.fromRGB(35, 35, 35);
			dropdown_btn.BorderSizePixel = 1;
			dropdown_btn.Name = "dropdown_btn";
			dropdown_btn.Position = UDim2.fromScale(0.695, 0.1225);
			dropdown_btn.Size = UDim2.fromScale(0.275, 0.77);
			dropdown_btn.Visible = true;
			dropdown_btn.Text = "";
			dropdown_btn.TextTransparency = 1;
			dropdown_btn.TextColor3 = Color3.fromRGB(255, 255, 255);
			dropdown_btn.Font = Enum.Font.Gotham;
			dropdown_btn.Parent = tab_btn;
			
			local dropdown_text = Instance.new("TextLabel");
			dropdown_text.Active = false;
			dropdown_text.BackgroundTransparency = 1;
			dropdown_text.Name = "dropdown_text";
			dropdown_text.Position = UDim2.fromScale(0, 0.075);
			dropdown_text.Size = UDim2.fromScale(0.75, 0.85);
			dropdown_text.Visible = true;
			dropdown_text.Font = Enum.Font.Gotham;
			dropdown_text.Text = " ...";
			dropdown_text.TextTransparency = 0;
			dropdown_text.ZIndex = 2;
			dropdown_text.TextColor3 = Color3.fromRGB(255, 255, 255);
			dropdown_text.TextXAlignment = Enum.TextXAlignment.Left;
			dropdown_text.TextScaled = true;
			dropdown_text.Parent = dropdown_btn;

			local dropdown_icon = Instance.new("ImageLabel");
			dropdown_icon.Active = false;
			dropdown_icon.BackgroundTransparency = 1;
			dropdown_icon.Name = "dropdown_icon";
			dropdown_icon.Position = UDim2.fromScale(0.8, 0.15);
			dropdown_icon.Size = UDim2.fromScale(0.15, 0.75);
			dropdown_icon.Visible = true;
			dropdown_icon.ZIndex = 2;
			dropdown_icon.Image = "http://www.roblox.com/asset/?id=14596383084";
			dropdown_icon.ImageColor3 = Color3.fromRGB(255, 255, 255);
			dropdown_icon.Parent = dropdown_btn;
			
			local canvas_size = (#items + 1) / 1.5;
			local dropdown_frame = Instance.new("ScrollingFrame");
			dropdown_frame.BackgroundColor3 = Color3.fromRGB(44, 44, 44);
			dropdown_frame.BorderSizePixel = 0;
			dropdown_frame.BackgroundTransparency = 0;
			dropdown_frame.BorderColor3 = Color3.fromRGB(35, 35, 35);
			dropdown_frame.Position = UDim2.fromScale(0, 1);
			dropdown_frame.Size = UDim2.fromScale(1, 0);
			dropdown_frame.ScrollBarThickness = 4;
			dropdown_frame.ScrollingDirection = Enum.ScrollingDirection.Y;
			dropdown_frame.Visible = false;
			dropdown_frame.Name = "Dropdown";
			dropdown_frame.ZIndex = 3;
			dropdown_frame.CanvasSize = UDim2.fromScale(0, canvas_size);
			dropdown_frame.Parent = dropdown_btn;
			
			local ui_list_layout = Instance.new("UIListLayout");
			ui_list_layout.FillDirection = Enum.FillDirection.Vertical;
			ui_list_layout.HorizontalAlignment = Enum.HorizontalAlignment.Center;
			ui_list_layout.SortOrder = Enum.SortOrder.LayoutOrder;
			ui_list_layout.VerticalAlignment = Enum.VerticalAlignment.Top;
			ui_list_layout.Padding = UDim.new(0, 3);
			ui_list_layout.Parent = dropdown_frame;

		    local element_size = 0.625;
			for i,v in pairs(items) do
				if items ~= nil and type(items) == "table" then
					local option_btn = Instance.new("TextButton");
					option_btn.BackgroundColor3 = Color3.fromRGB(42, 42, 42);
					option_btn.BackgroundTransparency = 0;
					option_btn.BorderColor3 = Color3.fromRGB(30, 30, 30);
					option_btn.BorderSizePixel = 1;
					option_btn.Name = tostring(v);
					option_btn.FontFace = Font.fromId(11598121416, Enum.FontWeight.Regular, Enum.FontStyle.Normal);
					option_btn.Text = tostring(v);
					option_btn.TextColor3 = Color3.fromRGB(255, 255, 255);
					option_btn.TextScaled = true;
					option_btn.AutoButtonColor = false;
					option_btn.Size = UDim2.fromScale(1, element_size / canvas_size);
					option_btn.Parent = dropdown_frame;

					option_btn.MouseButton1Click:Connect(function()
						for _,v in pairs(dropdown_frame:GetChildren()) do
							if v:IsA("TextButton") and v ~= option_btn and v.BackgroundColor3 == Color3.fromRGB(52, 52, 52) then
								v.BackgroundColor3 = Color3.fromRGB(42, 42, 42);
								v.BorderColor3 = Color3.fromRGB(30, 30, 30);
							end
						end
						
						dropdown_frame.Size = UDim2.fromScale(1, 0);
						dropdown_icon.Rotation = 0;
						dropdown_frame.Visible = false;
						tab_btn.ZIndex = 1;	
						task.spawn(action, tostring(v));

						dropdown_text.Text = " "..tostring(v);
						option_btn.BackgroundColor3 = Color3.fromRGB(52, 52, 52);
						option_btn.BorderColor3 = Color3.fromRGB(60, 60, 60);
					end)
				end
			end
			
			dropdown_btn.MouseButton1Click:Connect(function()
				if dropdown_frame.Visible == false then
					for _,frames in pairs(tab_frames:GetChildren()) do
						if frames:IsA("ScrollingFrame") then
							for _,dr1 in pairs(frames:GetChildren()) do
								if dr1:IsA("Frame") and dr1 ~= dropdown_btn then
									if dr1:FindFirstChild("dropdown_btn") ~= nil and dr1:FindFirstChild("dropdown_btn"):FindFirstChild("Dropdown") ~= nil and dr1:FindFirstChild("dropdown_btn"):FindFirstChild("Dropdown").Visible == true then
										dr1:FindFirstChild("dropdown_btn"):FindFirstChild("dropdown_icon").Rotation = 0;
										dr1:FindFirstChild("dropdown_btn"):FindFirstChild("Dropdown").Size = UDim2.fromScale(1, 0);
										dr1:FindFirstChild("dropdown_btn"):FindFirstChild("Dropdown").Visible = false;
										dr1.ZIndex = 1;
									end
								end
							end
						end
					end
					
					dropdown_frame.Size = UDim2.fromScale(1, 4);
					dropdown_icon.Rotation = 180;
					tab_btn.ZIndex = 3;
					dropdown_frame.Visible = true;
				elseif dropdown_frame.Visible == true then
					dropdown_frame.Size = UDim2.fromScale(1, 0);
					dropdown_icon.Rotation = 0;
					dropdown_frame.Visible = false;
					tab_btn.ZIndex = 1;	
				end
			end)
			
			local dropdown_funcs = {}
			
			function dropdown_funcs:Refresh(items)
				if items ~= nil and type(items) == "table" then
					for _,item in pairs(dropdown_frame:GetChildren()) do
						if item:IsA("TextButton") then
							item:Destroy();
						end
					end
					
					local canvas_size = (#items + 1) / 1.5;
					dropdown_frame.CanvasSize = UDim2.fromScale(0, canvas_size);

					for i,v in pairs(items) do
						local option_btn = Instance.new("TextButton");
						option_btn.BackgroundColor3 = Color3.fromRGB(42, 42, 42);
						option_btn.BackgroundTransparency = 0;
						option_btn.BorderColor3 = Color3.fromRGB(30, 30, 30);
						option_btn.BorderSizePixel = 1;
						option_btn.Name = tostring(v);
						option_btn.FontFace = Font.fromId(11598121416, Enum.FontWeight.Regular, Enum.FontStyle.Normal);
						option_btn.Text = tostring(v);
						option_btn.TextColor3 = Color3.fromRGB(255, 255, 255);
						option_btn.TextScaled = true;
						option_btn.Size = UDim2.fromScale(1, element_size / canvas_size);
						option_btn.Parent = dropdown_frame;

						option_btn.MouseButton1Click:Connect(function()
							for _,v in pairs(dropdown_frame:GetChildren()) do
								if v:IsA("TextButton") and v ~= option_btn and v.BackgroundColor3 == Color3.fromRGB(52, 52, 52) then
									v.BackgroundColor3 = Color3.fromRGB(42, 42, 42);
									v.BorderColor3 = Color3.fromRGB(30, 30, 30);
								end
							end

							dropdown_frame.Size = UDim2.fromScale(1, 0);
							dropdown_icon.Rotation = 0;
							dropdown_frame.Visible = false;
							tab_btn.ZIndex = 1;		
							task.spawn(action, tostring(v));

							dropdown_text.Text = " "..tostring(v);
							option_btn.BackgroundColor3 = Color3.fromRGB(52, 52, 52);
							option_btn.BorderColor3 = Color3.fromRGB(60, 60, 60);
							tween.Completed:Wait();
						end)
					end
				end
			end
			
			function dropdown_funcs:GetCurrentItems()
				local current_items = {};
				
				for _,item in pairs(dropdown_frame:GetChildren()) do
					if item:IsA("TextButton") then
						if not table.find(current_items, item.Name) then
							table.insert(current_items, item.Name);
						end
					end
				end
				
				return current_items;
			end
			
			return dropdown_funcs;
		end
		
		function tab_funcs:NewMultiDropdown(name, items, action)
			if tostring(name) == nil then return error("[dizzy hub] Dropdown's name is undefined. (name: "..tostring(name).." )") end
			if items == nil or typeof(items) ~= "table" then return error("[dizzy hub] Multidropdown's items are undefined. (name: "..tostring(name).." )") end
			
			local current_items = {};
			
			local tab_btn = Instance.new("Frame", frame);
			tab_btn.BackgroundColor3 = Color3.fromRGB(17, 17, 17);
			tab_btn.Name = tostring(name);
			tab_btn.Position = UDim2.fromScale(0, 0.149);
			tab_btn.Size = UDim2.fromScale(0.965, 0.063);
			tab_btn.Transparency = 1;
			tab_btn.Visible = true;
			tab_btn.BackgroundTransparency = 0;
			tab_btn.BorderSizePixel = 0;
			tab_btn.ZIndex = 1;

			local ui_stroke = Instance.new("UIStroke");
			ui_stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
			ui_stroke.Color = Color3.fromRGB(38, 38, 38);
			ui_stroke.LineJoinMode = Enum.LineJoinMode.Round;
			ui_stroke.Thickness = 1;
			ui_stroke.Transparency = 0;
			ui_stroke.Parent = tab_btn;

			local ui_c = Instance.new("UICorner");
			ui_c.CornerRadius = UDim.new(0, 6);
			ui_c.Parent = tab_btn;

			local btn_title = Instance.new("TextLabel");
			btn_title.BackgroundTransparency = 1;
			btn_title.Name = "Title";
			btn_title.Size = UDim2.fromScale(0.35, 0.75);
			btn_title.Position = UDim2.fromScale(0.025, 0.15);
			btn_title.Visible = true;
			btn_title.Active = false;
			btn_title.Text = tostring(name);
			btn_title.TextScaled = true;
			btn_title.TextColor3 = Color3.fromRGB(255, 255, 255);
			btn_title.Font = Enum.Font.Gotham;
			btn_title.TextXAlignment = Enum.TextXAlignment.Left;
			btn_title.Parent = tab_btn;

			local dropdown_btn = Instance.new("TextButton");
			dropdown_btn.Active = true;
			dropdown_btn.AutoButtonColor = false;
			dropdown_btn.BackgroundTransparency = 0;
			dropdown_btn.BackgroundColor3 = Color3.fromRGB(48, 48, 48);
			dropdown_btn.BorderColor3 = Color3.fromRGB(35, 35, 35);
			dropdown_btn.BorderSizePixel = 1;
			dropdown_btn.Name = "dropdown_btn";
			dropdown_btn.Position = UDim2.fromScale(0.695, 0.1225);
			dropdown_btn.Size = UDim2.fromScale(0.275, 0.77);
			dropdown_btn.Visible = true;
			dropdown_btn.Text = "";
			dropdown_btn.TextTransparency = 1;
			dropdown_btn.TextColor3 = Color3.fromRGB(255, 255, 255);
			dropdown_btn.Font = Enum.Font.Gotham;
			dropdown_btn.Parent = tab_btn
			
			local dropdown_text = Instance.new("TextLabel");
			dropdown_text.Active = false;
			dropdown_text.BackgroundTransparency = 1;
			dropdown_text.Name = "dropdown_text";
			dropdown_text.Position = UDim2.fromScale(0, 0.075);
			dropdown_text.Size = UDim2.fromScale(0.75, 0.85);
			dropdown_text.Visible = true;
			dropdown_text.Font = Enum.Font.Gotham;
			dropdown_text.Text = " ...";
			dropdown_text.TextTransparency = 0;
			dropdown_text.ZIndex = 2;
			dropdown_text.TextColor3 = Color3.fromRGB(255, 255, 255);
			dropdown_text.TextXAlignment = Enum.TextXAlignment.Left;
			dropdown_text.TextScaled = true;
			dropdown_text.Parent = dropdown_btn;
			
			local dropdown_icon = Instance.new("ImageLabel");
			dropdown_icon.Active = false;
			dropdown_icon.BackgroundTransparency = 1;
			dropdown_icon.Name = "dropdown_icon";
			dropdown_icon.Position = UDim2.fromScale(0.8, 0.15);
			dropdown_icon.Size = UDim2.fromScale(0.15, 0.75);
			dropdown_icon.Visible = true;
			dropdown_icon.ZIndex = 2;
			dropdown_icon.Image = "http://www.roblox.com/asset/?id=14596383084";
			dropdown_icon.ImageColor3 = Color3.fromRGB(255, 255, 255);
			dropdown_icon.Parent = dropdown_btn;

			local canvas_size = (#items + 1) / 1.5;
			local dropdown_frame = Instance.new("ScrollingFrame");
			dropdown_frame.BackgroundColor3 = Color3.fromRGB(44, 44, 44);
			dropdown_frame.BorderSizePixel = 0;
			dropdown_frame.BackgroundTransparency = 0;
			dropdown_frame.BorderColor3 = Color3.fromRGB(35, 35, 35);
			dropdown_frame.Position = UDim2.fromScale(0, 1);
			dropdown_frame.Size = UDim2.fromScale(1, 0);
			dropdown_frame.ScrollingDirection = Enum.ScrollingDirection.Y;
			dropdown_frame.ScrollBarThickness = 4;
			dropdown_frame.Visible = false;
			dropdown_frame.Name = "Dropdown";
			dropdown_frame.ZIndex = 1;
			dropdown_frame.CanvasSize = UDim2.fromScale(0, canvas_size);
			dropdown_frame.Parent = dropdown_btn;

			local ui_list_layout = Instance.new("UIListLayout");
			ui_list_layout.FillDirection = Enum.FillDirection.Vertical;
			ui_list_layout.HorizontalAlignment = Enum.HorizontalAlignment.Center;
			ui_list_layout.SortOrder = Enum.SortOrder.LayoutOrder;
			ui_list_layout.VerticalAlignment = Enum.VerticalAlignment.Top;
			ui_list_layout.Padding = UDim.new(0, 3);
			ui_list_layout.Parent = dropdown_frame;

			local element_size = 0.625;
			for i,v in pairs(items) do
				if items ~= nil and type(items) == "table" then	
					local option_btn = Instance.new("TextButton");
					option_btn.BackgroundColor3 = Color3.fromRGB(42, 42, 42);
					option_btn.BackgroundTransparency = 0;
					option_btn.BorderColor3 = Color3.fromRGB(30, 30, 30);
					option_btn.BorderSizePixel = 1;
					option_btn.Name = tostring(v)
					option_btn.FontFace = Font.fromId(11598121416, Enum.FontWeight.Regular, Enum.FontStyle.Normal);
					option_btn.Text = tostring(v);
					option_btn.TextColor3 = Color3.fromRGB(255, 255, 255);
					option_btn.TextScaled = true;
					option_btn.AutoButtonColor = false;
					option_btn.Size = UDim2.fromScale(1, element_size / canvas_size);
					option_btn.Parent = dropdown_frame;

					option_btn.MouseButton1Click:Connect(function()
						if table.find(current_items, option_btn.Name) then
							table.remove(current_items, table.find(current_items, option_btn.Name));
							option_btn.BackgroundColor3 = Color3.fromRGB(42, 42, 42);
							option_btn.BorderColor3 = Color3.fromRGB(30, 30, 30);
						elseif not table.find(current_items, option_btn.Name) then
							table.insert(current_items, option_btn.Name);
							option_btn.BackgroundColor3 = Color3.fromRGB(52, 52, 52);
							option_btn.BorderColor3 = Color3.fromRGB(60, 60, 60);
						end
						
						task.spawn(action, current_items);

						if #current_items > 0 then
							dropdown_text.Text = " "..tostring(#current_items).." items...";
						else
							dropdown_text.Text = " ...";
						end
					end)
				end
			end

			dropdown_btn.MouseButton1Click:Connect(function()
				if dropdown_frame.Visible == false then
					for _,frames in pairs(tab_frames:GetChildren()) do
						if frames:IsA("ScrollingFrame") then
							for _,dr1 in pairs(frames:GetChildren()) do
								if dr1:IsA("Frame") and dr1 ~= dropdown_btn then
									if dr1:FindFirstChild("dropdown_btn") ~= nil and dr1:FindFirstChild("dropdown_btn"):FindFirstChild("Dropdown") ~= nil and dr1:FindFirstChild("dropdown_btn"):FindFirstChild("Dropdown").Visible == true then
										dr1:FindFirstChild("dropdown_btn"):FindFirstChild("dropdown_icon").Rotation = 0;
										dr1:FindFirstChild("dropdown_btn"):FindFirstChild("Dropdown").Size = UDim2.fromScale(1, 0);
										dr1:FindFirstChild("dropdown_btn"):FindFirstChild("Dropdown").Visible = false;
										dr1.ZIndex = 1;
									end
								end
							end
						end
					end

					dropdown_frame.Size = UDim2.fromScale(1, 4);
					dropdown_icon.Rotation = 180;
					tab_btn.ZIndex = 3;
					dropdown_frame.Visible = true;
				elseif dropdown_frame.Visible == true then
					dropdown_frame.Size = UDim2.fromScale(1, 0);
					dropdown_icon.Rotation = 0;
					dropdown_frame.Visible = false;
					tab_btn.ZIndex = 1;	
				end
			end)
			
			local multidropdown_funcs = {}
			
			function multidropdown_funcs:Refresh(items)
				if items ~= nil and type(items) == "table" then
					for _,item in pairs(dropdown_frame:GetChildren()) do
						if item:IsA("TextButton") then
							item:Destroy();
						end
					end
					
					current_items = {};
					local canvas_size = (#items + 1) / 1.5;
					dropdown_frame.CanvasSize = UDim2.fromScale(0, canvas_size);
					
					for i,v in pairs(items) do
						local option_btn = Instance.new("TextButton");
						option_btn.BackgroundColor3 = Color3.fromRGB(42, 42, 42);
						option_btn.BackgroundTransparency = 0;
						option_btn.BorderColor3 = Color3.fromRGB(30, 30, 30);
						option_btn.BorderSizePixel = 1;
						option_btn.Name = tostring(v);
						option_btn.FontFace = Font.fromId(11598121416, Enum.FontWeight.Regular, Enum.FontStyle.Normal);
						option_btn.Text = tostring(v);
						option_btn.TextColor3 = Color3.fromRGB(255, 255, 255);
						option_btn.TextScaled = true;
						option_btn.Size = UDim2.fromScale(1, element_size / canvas_size);
						option_btn.Parent = dropdown_frame;

						option_btn.MouseButton1Click:Connect(function()
							if table.find(current_items, option_btn.Name) then
								table.remove(current_items, table.find(current_items, option_btn.Name));
								option_btn.BackgroundColor3 = Color3.fromRGB(42, 42, 42);
								option_btn.BorderColor3 = Color3.fromRGB(30, 30, 30);
							elseif not table.find(current_items, option_btn.Name) then
								table.insert(current_items, option_btn.Name);
								option_btn.BackgroundColor3 = Color3.fromRGB(52, 52, 52);
								option_btn.BorderColor3 = Color3.fromRGB(60, 60, 60);
							end
							
							task.spawn(action, current_items);

							if #current_items > 0 then
								dropdown_text.Text = " "..tostring(#current_items).." items...";
							else
								dropdown_text.Text = " ...";
							end
						end)
					end
				end
			end
			
			function multidropdown_funcs:GetCurrentItems()
				local current_items = {};

				for _,item in pairs(dropdown_frame:GetChildren()) do
					if item:IsA("TextButton") then
						if not table.find(current_items, item.Name) then
							table.insert(current_items, item.Name);
						end
					end
				end

				return current_items;
			end
			
			return multidropdown_funcs;
		end
		
		function tab_funcs:NewInputBox(name, value_type, action)
			if tostring(name) == nil then return error("[dizzy hub] InputBox's name is undefined. (name: "..tostring(name).." )") end
			if tostring(value_type) == nil or tostring(value_type) ~= "string" and tostring(value_type) ~= "number" then return error("[dizzy hub] InputBox's value type is undefined. (name: "..tostring(name).." )") end
			
			local tab_btn = Instance.new("Frame");
			tab_btn.BackgroundColor3 = Color3.fromRGB(17, 17, 17);
			tab_btn.Name = tostring(name);
			tab_btn.Position = UDim2.fromScale(0, 0);
			tab_btn.Size = UDim2.fromScale(0.965, 0.063);
			tab_btn.Transparency = 1;
			tab_btn.Visible = true;
			tab_btn.BackgroundTransparency = 0;
			tab_btn.BorderSizePixel = 0;
			tab_btn.ZIndex = 2;
			tab_btn.Parent = frame;

			local ui_stroke = Instance.new("UIStroke");
			ui_stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
			ui_stroke.Color = Color3.fromRGB(38, 38, 38);
			ui_stroke.LineJoinMode = Enum.LineJoinMode.Round;
			ui_stroke.Thickness = 1;
			ui_stroke.Transparency = 0;
			ui_stroke.Parent = tab_btn;

			local ui_c = Instance.new("UICorner");
			ui_c.CornerRadius = UDim.new(0, 6);
			ui_c.Parent = tab_btn;

			local btn_title = Instance.new("TextLabel");
			btn_title.BackgroundTransparency = 1;
			btn_title.Name = "Title";
			btn_title.Size = UDim2.fromScale(0.57, 0.75);
			btn_title.Position = UDim2.fromScale(0.025, 0.15);
			btn_title.Visible = true;
			btn_title.Active = false;
			btn_title.Text = tostring(name);
			btn_title.TextScaled = true;
			btn_title.TextColor3 = Color3.fromRGB(255, 255, 255);
			btn_title.Font = Enum.Font.Gotham;
			btn_title.TextXAlignment = Enum.TextXAlignment.Left;
			btn_title.Parent = tab_btn;
			
			local input_box = Instance.new("TextBox");
			input_box.BackgroundColor3 = Color3.fromRGB(48, 48, 48);
			input_box.BackgroundTransparency = 0;
			input_box.ClearTextOnFocus = false;
			input_box.Position = UDim2.fromScale(0.625, 0.1);
			input_box.Name = "Input";
			input_box.Size = UDim2.fromScale(0.35, 0.8);
			input_box.Visible = true;
			input_box.ShowNativeInput = true;
			input_box.TextScaled = true;
			input_box.Text = "";
			input_box.TextColor3 = Color3.fromRGB(255, 255, 255);
			input_box.TextStrokeTransparency = 1;
			input_box.Font = Enum.Font.Gotham;
			input_box.Parent = tab_btn;

			input_box.Changed:Connect(function(p)
				if p == "Text" and game:GetService("UserInputService"):GetFocusedTextBox() then
					if tostring(value_type) == "number" and tonumber(input_box.Text) ~= nil then
						task.spawn(action, tonumber(input_box.Text));
					elseif tostring(value_type) == "string" and tostring(input_box.Text) ~= nil then
						task.spawn(action, tostring(input_box.Text));
					end
				end
			end)
		end
		
		function tab_funcs:NewKeybind(name, keybind_mode, action)
			if tostring(name) == nil then return error("[dizzy hub] InputBox's name is undefined. (name: "..tostring(name).." )") end
			if tonumber(keybind_mode) == nil or tonumber(keybind_mode) > 3 or tonumber(keybind_mode) <= 0 then return error("[dizzy hub] Keybind's mode is undefined. (name: "..tostring(name).." )") end
			
			local event_con1;
			local event_con2;
			local editing_key = false;
			local key_value;
			local keybind_mainevent;
			local settings_status = false;
			
			local tab_btn = Instance.new("Frame");
			tab_btn.BackgroundColor3 = Color3.fromRGB(17, 17, 17);
			tab_btn.Name = tostring(name);
			tab_btn.Position = UDim2.fromScale(0, 0);
			tab_btn.Size = UDim2.fromScale(0.965, 0.063);
			tab_btn.Transparency = 1;
			tab_btn.Visible = true;
			tab_btn.BackgroundTransparency = 0;
			tab_btn.BorderSizePixel = 0;
			tab_btn.ZIndex = 2;
			tab_btn.Parent = frame;

			local ui_stroke = Instance.new("UIStroke");
			ui_stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
			ui_stroke.Color = Color3.fromRGB(38, 38, 38);
			ui_stroke.LineJoinMode = Enum.LineJoinMode.Round;
			ui_stroke.Thickness = 1;
			ui_stroke.Transparency = 0;
			ui_stroke.Parent = tab_btn;

			local ui_c = Instance.new("UICorner");
			ui_c.CornerRadius = UDim.new(0, 6);
			ui_c.Parent = tab_btn;

			local btn_title = Instance.new("TextLabel");
			btn_title.BackgroundTransparency = 1;
			btn_title.Name = "Title";
			btn_title.Size = UDim2.fromScale(0.457, 0.75);
			btn_title.Position = UDim2.fromScale(0.025, 0.15);
			btn_title.Visible = true;
			btn_title.Active = false;
			btn_title.Text = tostring(name);
			btn_title.TextScaled = true;
			btn_title.TextColor3 = Color3.fromRGB(255, 255, 255);
			btn_title.Font = Enum.Font.Gotham;
			btn_title.TextXAlignment = Enum.TextXAlignment.Left;
			btn_title.Parent = tab_btn;
			
			local keybind_btn = Instance.new("TextButton");
			keybind_btn.BackgroundTransparency = 0;
			keybind_btn.BackgroundColor3 = Color3.fromRGB(48, 48, 48);
			keybind_btn.Name = "Keybind";
			keybind_btn.Position = UDim2.fromScale(0.825, 0.075);
			keybind_btn.Size = UDim2.fromScale(0.15, 0.85);
			keybind_btn.Visible = true;
			keybind_btn.Text = "None";
			keybind_btn.TextColor3 = Color3.fromRGB(255, 255, 255);
			keybind_btn.Font = Enum.Font.Gotham;
			keybind_btn.TextScaled = true;
			keybind_btn.TextStrokeTransparency = 1;
			keybind_btn.AutoButtonColor = false;
			keybind_btn.Parent = tab_btn;

			local keybind_settings = Instance.new("ImageButton");
			keybind_settings.Active = true;
			keybind_settings.BackgroundTransparency = 1;
			keybind_settings.Position = UDim2.fromScale(0.75, 0.15);
			keybind_settings.Size = UDim2.fromScale(0.05, 0.7);
			keybind_settings.Visible = true;
			keybind_settings.Image = "rbxassetid://1185031129";
			keybind_settings.ImageColor3 = Color3.fromRGB(255, 255, 255);
			keybind_settings.ImageTransparency = 0;
			keybind_settings.Name = "keybind_settings";
			keybind_settings.Parent = tab_btn;
			
			local keybind_settings_frame = Instance.new("Frame");
			keybind_settings_frame.BackgroundTransparency = 0;
			keybind_settings_frame.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
			keybind_settings_frame.BorderSizePixel = 0;
			keybind_settings_frame.Name = "Settings";
			keybind_settings_frame.Position = UDim2.fromScale(1.5, 0.5);
			keybind_settings_frame.Size = UDim2.fromScale(0, 0);
			keybind_settings_frame.Visible = false;
			keybind_settings_frame.ZIndex = 1;
			keybind_settings_frame.Parent = keybind_settings;

			local ui_list_layout = Instance.new("UIListLayout");
			ui_list_layout.FillDirection = Enum.FillDirection.Vertical;
			ui_list_layout.HorizontalAlignment = Enum.HorizontalAlignment.Center;
			ui_list_layout.SortOrder = Enum.SortOrder.LayoutOrder;
			ui_list_layout.VerticalAlignment = Enum.VerticalAlignment.Top;
			ui_list_layout.Padding = UDim.new(0, 2);
			ui_list_layout.Parent = keybind_settings_frame;
			
			local on_hold_btn = Instance.new("TextButton");
			on_hold_btn.BackgroundTransparency = 0;
			on_hold_btn.BackgroundColor3 = Color3.fromRGB(45, 45, 45);
			on_hold_btn.Name = "on_hold";
			on_hold_btn.Size = UDim2.fromScale(1, 0.3);
			on_hold_btn.Visible = true;
			on_hold_btn.Text = "on hold";
			on_hold_btn.TextColor3 = Color3.fromRGB(255, 255, 255);
			on_hold_btn.Font = Enum.Font.Gotham;
			on_hold_btn.TextScaled = true;
			on_hold_btn.TextStrokeTransparency = 1;
			on_hold_btn.AutoButtonColor = false;
			on_hold_btn.Parent = keybind_settings_frame;

			local on_toggle_btn = Instance.new("TextButton");
			on_toggle_btn.BackgroundTransparency = 0;
			on_toggle_btn.BackgroundColor3 = Color3.fromRGB(45, 45, 45);
			on_toggle_btn.Name = "on_toggle";
			on_toggle_btn.Size = UDim2.fromScale(1, 0.3);
			on_toggle_btn.Visible = true;
			on_toggle_btn.Text = "on toggle";
			on_toggle_btn.TextColor3 = Color3.fromRGB(255, 255, 255);
			on_toggle_btn.Font = Enum.Font.Gotham;
			on_toggle_btn.TextScaled = true;
			on_toggle_btn.TextStrokeTransparency = 1;
			on_toggle_btn.AutoButtonColor = false;
			on_toggle_btn.Parent = keybind_settings_frame;

			local always_on_btn = Instance.new("TextButton");
			always_on_btn.BackgroundTransparency = 0;
			always_on_btn.BackgroundColor3 = Color3.fromRGB(45, 45, 45);
			always_on_btn.Name = "always_on";
			always_on_btn.Size = UDim2.fromScale(1, 0.3);
			always_on_btn.Visible = true;
			always_on_btn.Text = "always on";
			always_on_btn.TextColor3 = Color3.fromRGB(255, 255, 255);
			always_on_btn.Font = Enum.Font.Gotham;
			always_on_btn.TextScaled = true;
			always_on_btn.TextStrokeTransparency = 1;
			always_on_btn.AutoButtonColor = false;
			always_on_btn.Parent = keybind_settings_frame;

			if keybind_mode == 1 then
				on_hold_btn.BackgroundColor3 = Color3.fromRGB(61, 61, 61);
				
				event_con1 = game:GetService("UserInputService").InputBegan:Connect(function(input, processed)
					if not gui.Parent or gui == nil then
		    			event_con1:Disconnect();
					end
						
					if not processed then
						if key_value == nil or input.UserInputType ~= Enum.UserInputType.Keyboard or input.KeyCode == nil or game:GetService("UserInputService"):GetStringForKeyCode(input.KeyCode) == "" or tonumber(string.byte(tostring(game:GetService("UserInputService"):GetStringForKeyCode(input.KeyCode)))) ~= tonumber(key_value) then
							return;
						end

						task.spawn(action, true);
					end
				end)

				event_con2 = game:GetService("UserInputService").InputEnded:Connect(function(input, processed)
					if not gui.Parent or gui == nil then
		    			event_con2:Disconnect();
					end
						
					if not processed then
						if key_value == nil or input.UserInputType ~= Enum.UserInputType.Keyboard or input.KeyCode == nil or game:GetService("UserInputService"):GetStringForKeyCode(input.KeyCode) == "" or tonumber(string.byte(tostring(game:GetService("UserInputService"):GetStringForKeyCode(input.KeyCode)))) ~= tonumber(key_value) then
							return;
						end

						task.spawn(action, false);
					end
				end)
			elseif keybind_mode == 2 then
				local toggled = false;
				
				on_toggle_btn.BackgroundColor3 = Color3.fromRGB(61, 61, 61);
				
				event_con1 = game:GetService("UserInputService").InputEnded:Connect(function(input, processed)
					if not gui.Parent or gui == nil then
		    		    event_con1:Disconnect();
					end
						
					if not processed then
						if key_value == nil or input.UserInputType ~= Enum.UserInputType.Keyboard or input.KeyCode == nil or game:GetService("UserInputService"):GetStringForKeyCode(input.KeyCode) == "" or tonumber(string.byte(tostring(game:GetService("UserInputService"):GetStringForKeyCode(input.KeyCode)))) ~= tonumber(key_value) then
							return;
						end

						toggled = not toggled;
						task.spawn(action, toggled);
					end
				end)
			elseif keybind_mode == 3 then
				always_on_btn.BackgroundColor3 = Color3.fromRGB(61, 61, 61);
				
				task.spawn(action, true);
			end
			
			keybind_btn.MouseButton1Click:Connect(function()
				editing_key = not editing_key;
				
				if editing_key then
					local old_key = keybind_btn.Text;
					local old_key_val = key_value;
					
					keybind_btn.Text = "";
					key_value = nil;
					
					keybind_mainevent = game:GetService("UserInputService").InputEnded:Connect(function(input, processed)
						if not processed then
							if input.UserInputType == Enum.UserInputType.Keyboard then
								if input.KeyCode == Enum.KeyCode.Escape then
									keybind_btn.Text = old_key;
									key_value = old_key_val;
									keybind_mainevent:Disconnect();
								else
									if input.KeyCode ~= nil and game:GetService("UserInputService"):GetStringForKeyCode(input.KeyCode) ~= "" and string.byte(tostring(game:GetService("UserInputService"):GetStringForKeyCode(input.KeyCode))) ~= nil then
										key_value = tonumber(string.byte(tostring(game:GetService("UserInputService"):GetStringForKeyCode(input.KeyCode))));
										keybind_btn.Text = tostring(game:GetService("UserInputService"):GetStringForKeyCode(input.KeyCode));
										keybind_mainevent:Disconnect();
									else
										keybind_btn.Text = "None";
										key_value = nil;
										keybind_mainevent:Disconnect();
									end
								end
							end
						end
					end)
				elseif not editing_key then
					if keybind_mainevent ~= nil then
						keybind_mainevent:Disconnect();
					end
					keybind_btn.Text = "None";
					key_value = nil;
				end
			end)
			
			keybind_settings.MouseButton1Click:Connect(function()
				if keybind_settings_frame.Visible == false then
					for _,frames in pairs(tab_frames:GetChildren()) do
						if frames:IsA("ScrollingFrame") then
							for _,ks1 in pairs(frames:GetChildren()) do
								if ks1:IsA("Frame") and ks1 ~= tab_btn then
									if ks1:FindFirstChild("keybind_settings") ~= nil and ks1:FindFirstChild("keybind_settings"):FindFirstChild("Settings") ~= nil and ks1:FindFirstChild("keybind_settings"):FindFirstChild("Settings").Visible == true then
										if frames == frame then
											keybind_settings_frame:TweenSizeAndPosition(UDim2.fromScale(0, 0), UDim2.fromScale(1.5, 0.5), Enum.EasingDirection.Out, Enum.EasingStyle.Sine, 0.5, true, function() keybind_settings_frame.ZIndex = 1; keybind_settings_frame.Visible = false; end)
										else
											ks1:FindFirstChild("keybind_settings"):FindFirstChild("Settings").Size = UDim2.fromScale(0, 0);
											ks1:FindFirstChild("keybind_settings"):FindFirstChild("Settings").Position = UDim2.fromScale(1.5, 0.5);
											ks1:FindFirstChild("keybind_settings"):FindFirstChild("Settings").Visible = false;
											ks1:FindFirstChild("keybind_settings"):FindFirstChild("Settings").ZIndex = 1;
										end
									end
								end
							end
						end
					end
					
					keybind_settings_frame.ZIndex = 5;
					keybind_settings_frame.Visible = true;
					keybind_settings_frame:TweenSizeAndPosition(UDim2.fromScale(3.5, 2.25), UDim2.fromScale(1.5, -0.6), Enum.EasingDirection.Out, Enum.EasingStyle.Sine, 0.5, true, nil)
				elseif keybind_settings_frame.Visible == true then
					keybind_settings_frame:TweenSizeAndPosition(UDim2.fromScale(0, 0), UDim2.fromScale(1.5, 0.5), Enum.EasingDirection.Out, Enum.EasingStyle.Sine, 0.5, true, function() keybind_settings_frame.ZIndex = 1; keybind_settings_frame.Visible = false; end)
				end
			end)
			
			on_hold_btn.MouseButton1Click:Connect(function()
				if event_con1 ~= nil then event_con1:Disconnect(); end
				if event_con2 ~= nil then event_con2:Disconnect(); end
				event_con1 = nil; event_con2 = nil;
				
				on_toggle_btn.BackgroundColor3 = Color3.fromRGB(45, 45, 45);
				always_on_btn.BackgroundColor3 = Color3.fromRGB(45, 45, 45);
				on_hold_btn.BackgroundColor3 = Color3.fromRGB(61, 61, 61);
				
				keybind_settings_frame:TweenSizeAndPosition(UDim2.fromScale(0, 0), UDim2.fromScale(1.5, 0.5), Enum.EasingDirection.Out, Enum.EasingStyle.Sine, 0.5, true, function() keybind_settings_frame.ZIndex = 1; keybind_settings_frame.Visible = false; end)
				
				event_con1 = game:GetService("UserInputService").InputBegan:Connect(function(input, processed)
					if not gui.Parent or gui == nil then
		    			event_con1:Disconnect();
					end
							
					if not processed then
						if key_value == nil or input.UserInputType ~= Enum.UserInputType.Keyboard or input.KeyCode == nil or game:GetService("UserInputService"):GetStringForKeyCode(input.KeyCode) == "" or tonumber(string.byte(tostring(game:GetService("UserInputService"):GetStringForKeyCode(input.KeyCode)))) ~= tonumber(key_value) then
							return;
						end

						task.spawn(action, true);
					end
				end)

				event_con2 = game:GetService("UserInputService").InputEnded:Connect(function(input, processed)
					if not gui.Parent or gui == nil then
		    			event_con2:Disconnect();
					end
							
					if not processed then
						if key_value == nil or input.UserInputType ~= Enum.UserInputType.Keyboard or input.KeyCode == nil or game:GetService("UserInputService"):GetStringForKeyCode(input.KeyCode) == "" or tonumber(string.byte(tostring(game:GetService("UserInputService"):GetStringForKeyCode(input.KeyCode)))) ~= tonumber(key_value) then
							return;
						end

						task.spawn(action, false);
					end
				end)
			end)
			
			on_toggle_btn.MouseButton1Click:Connect(function()
				if event_con1 ~= nil then event_con1:Disconnect(); end
				if event_con2 ~= nil then event_con2:Disconnect(); end
				event_con1 = nil; event_con2 = nil;

				on_hold_btn.BackgroundColor3 = Color3.fromRGB(45, 45, 45);
				always_on_btn.BackgroundColor3 = Color3.fromRGB(45, 45, 45);
				on_toggle_btn.BackgroundColor3 = Color3.fromRGB(61, 61, 61);

				keybind_settings_frame:TweenSizeAndPosition(UDim2.fromScale(0, 0), UDim2.fromScale(1.5, 0.5), Enum.EasingDirection.Out, Enum.EasingStyle.Sine, 0.5, true, function() keybind_settings_frame.ZIndex = 1; keybind_settings_frame.Visible = false; end)
				
				local toggled = false;
				
				event_con1 = game:GetService("UserInputService").InputEnded:Connect(function(input, processed)
					if not gui.Parent or gui == nil then
		    			event_con1:Disconnect();
					end
							
					if not processed then
						if key_value == nil or input.UserInputType ~= Enum.UserInputType.Keyboard or input.KeyCode == nil or game:GetService("UserInputService"):GetStringForKeyCode(input.KeyCode) == "" or tonumber(string.byte(tostring(game:GetService("UserInputService"):GetStringForKeyCode(input.KeyCode)))) ~= tonumber(key_value) then
							return;
						end

						toggled = not toggled;
						task.spawn(action, toggled);
					end
				end)
			end)
			
			always_on_btn.MouseButton1Click:Connect(function()
				if event_con1 ~= nil then event_con1:Disconnect(); end
				if event_con2 ~= nil then event_con2:Disconnect(); end
				event_con1 = nil; event_con2 = nil;

				on_hold_btn.BackgroundColor3 = Color3.fromRGB(45, 45, 45);
				on_toggle_btn.BackgroundColor3 = Color3.fromRGB(45, 45, 45);
				always_on_btn.BackgroundColor3 = Color3.fromRGB(61, 61, 61);
				
				keybind_settings_frame:TweenSizeAndPosition(UDim2.fromScale(0, 0), UDim2.fromScale(1.5, 0.5), Enum.EasingDirection.Out, Enum.EasingStyle.Sine, 0.5, true, function() keybind_settings_frame.Visible = false; end)

				task.spawn(action, true);
			end)
		end
		
		function tab_funcs:NewLabel(text)
			if tostring(text) == nil then return error("[dizzy hub] Label's text is undefined.") end
			
			local tab_label = Instance.new("Frame");
			tab_label.BackgroundColor3 = Color3.fromRGB(17, 17, 17);
			tab_label.Name = tostring(name);
			tab_label.Position = UDim2.fromScale(0.016, 0);
			tab_label.Size = UDim2.fromScale(0.935, 0.063);
			tab_label.Transparency = 1;
			tab_label.Visible = true;
			tab_label.BackgroundTransparency = 0;
			tab_label.BorderSizePixel = 0;
			tab_label.ZIndex = 2;
			tab_label.Parent = frame;
			
			local label_title = Instance.new("TextLabel");
			label_title.BackgroundTransparency = 1;
			label_title.Name = "label";
			label_title.Size = UDim2.fromScale(0.95, 0.75);
			label_title.Position = UDim2.fromScale(0.025, 0.15);
			label_title.Visible = true;
			label_title.Active = false;
			label_title.Text = tostring(text);
			label_title.TextScaled = true;
			label_title.TextColor3 = Color3.fromRGB(255, 255, 255);
			label_title.Font = Enum.Font.Gotham;
			label_title.TextXAlignment = Enum.TextXAlignment.Left;
			label_title.Parent = tab_label;
			
			local label_funcs = {};
			
			function label_funcs:UpdateText(text)
				label_title.Text = tostring(text);
			end
			
			return label_funcs;
		end
		
		return tab_funcs;
	end

	return gui_funcs;
end

return ui_lib;
