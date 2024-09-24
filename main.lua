-- Auto Click Script with No Cooldown using VirtualUser (Toggleable with 'L')

-- Settings
local toggleKey = Enum.KeyCode.P -- Key to toggle the auto-clicking

-- Variables
local autoClickEnabled = false   -- Flag to track if auto-clicking is enabled
local VirtualUser = game:GetService("VirtualUser") -- VirtualUser service

-- Function to perform the auto-click using VirtualUser
local function autoClick()
    while true do
        if autoClickEnabled then
            -- Simulate a left mouse button click using VirtualUser (no delay)
            VirtualUser:Button1Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
            VirtualUser:Button1Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
        end
        -- No cooldown, loop continuously
        task.wait()  -- Yield to avoid crashing, but keep running continuously
    end
end

-- Function to toggle auto-clicking when the key is pressed
local function toggleAutoClick(input)
    if input.KeyCode == toggleKey then
        autoClickEnabled = not autoClickEnabled
        if autoClickEnabled then
            print("Auto-clicking enabled!")
        else
            print("Auto-clicking disabled!")
        end
    end
end

-- Connect the toggle function to the key press event
game:GetService("UserInputService").InputBegan:Connect(toggleAutoClick)

-- Start the auto-click loop in a separate thread
spawn(autoClick)
