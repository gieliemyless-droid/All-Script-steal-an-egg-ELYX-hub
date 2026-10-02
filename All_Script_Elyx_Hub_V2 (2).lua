--[[
    All Script Elyx Hub V-2
    Improved Live Chat + Better Design
    Key: Elyx_Hub
]]

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")
local LocalPlayer = Players.LocalPlayer

local requestFunc = (syn and syn.request) or (http and http.request) or http_request or request or (fluxus and fluxus.request)

pcall(function()
    if CoreGui:FindFirstChild("ElyxHubV2") then
        CoreGui.ElyxHubV2:Destroy()
    end
end)

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ElyxHubV2"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = CoreGui

-- ========== LOADING SCREEN ==========
local LoadingFrame = Instance.new("Frame")
LoadingFrame.Size = UDim2.new(1, 0, 1, 0)
LoadingFrame.BackgroundColor3 = Color3.fromRGB(8, 8, 14)
LoadingFrame.BorderSizePixel = 0
LoadingFrame.Parent = ScreenGui

local HubTitle = Instance.new("TextLabel")
HubTitle.Size = UDim2.new(0, 450, 0, 50)
HubTitle.Position = UDim2.new(0.5, -225, 0.35, 0)
HubTitle.BackgroundTransparency = 1
HubTitle.Text = "All Script Elyx Hub V-2"
HubTitle.TextColor3 = Color3.fromRGB(200, 180, 255)
HubTitle.TextSize = 30
HubTitle.Font = Enum.Font.GothamBold
HubTitle.TextTransparency = 1
HubTitle.Parent = LoadingFrame

local CountLabel = Instance.new("TextLabel")
CountLabel.Size = UDim2.new(0, 200, 0, 70)
CountLabel.Position = UDim2.new(0.5, -100, 0.5, 0)
CountLabel.BackgroundTransparency = 1
CountLabel.Text = "10"
CountLabel.TextColor3 = Color3.fromRGB(170, 140, 255)
CountLabel.TextSize = 52
CountLabel.Font = Enum.Font.GothamBold
CountLabel.TextTransparency = 1
CountLabel.Parent = LoadingFrame

TweenService:Create(HubTitle, TweenInfo.new(0.8), {TextTransparency = 0}):Play()
task.wait(0.6)

for i = 1, 10 do
    CountLabel.Text = tostring(i)
    CountLabel.TextTransparency = 1
    TweenService:Create(CountLabel, TweenInfo.new(0.25), {TextTransparency = 0}):Play()
    task.wait(0.55)
    TweenService:Create(CountLabel, TweenInfo.new(0.2), {TextTransparency = 1}):Play()
    task.wait(0.15)
end

CountLabel.Visible = false
LoadingFrame:Destroy()

-- ========== KEY SYSTEM ==========
local KeyFrame = Instance.new("Frame")
KeyFrame.Size = UDim2.new(0, 380, 0, 230)
KeyFrame.Position = UDim2.new(0.5, -190, 0.5, -115)
KeyFrame.BackgroundColor3 = Color3.fromRGB(16, 13, 26)
KeyFrame.BorderSizePixel = 0
KeyFrame.Parent = ScreenGui
Instance.new("UICorner", KeyFrame).CornerRadius = UDim.new(0, 14)

local KeyStroke = Instance.new("UIStroke", KeyFrame)
KeyStroke.Color = Color3.fromRGB(130, 80, 230)
KeyStroke.Thickness = 1.6
KeyStroke.Transparency = 0.2

local KeyTitle = Instance.new("TextLabel")
KeyTitle.Size = UDim2.new(1, 0, 0, 45)
KeyTitle.BackgroundTransparency = 1
KeyTitle.Text = "Enter the Key"
KeyTitle.TextColor3 = Color3.fromRGB(220, 200, 255)
KeyTitle.TextSize = 22
KeyTitle.Font = Enum.Font.GothamBold
KeyTitle.Parent = KeyFrame

local KeyBox = Instance.new("TextBox")
KeyBox.Size = UDim2.new(0.85, 0, 0, 42)
KeyBox.Position = UDim2.new(0.075, 0, 0.32, 0)
KeyBox.BackgroundColor3 = Color3.fromRGB(28, 22, 45)
KeyBox.Text = ""
KeyBox.PlaceholderText = "Enter key here..."
KeyBox.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyBox.PlaceholderColor3 = Color3.fromRGB(140, 120, 180)
KeyBox.TextSize = 16
KeyBox.Font = Enum.Font.Gotham
KeyBox.ClearTextOnFocus = false
KeyBox.Parent = KeyFrame
Instance.new("UICorner", KeyBox).CornerRadius = UDim.new(0, 9)

local SubmitBtn = Instance.new("TextButton")
SubmitBtn.Size = UDim2.new(0.85, 0, 0, 42)
SubmitBtn.Position = UDim2.new(0.075, 0, 0.62, 0)
SubmitBtn.BackgroundColor3 = Color3.fromRGB(95, 55, 190)
SubmitBtn.Text = "Submit"
SubmitBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
SubmitBtn.TextSize = 16
SubmitBtn.Font = Enum.Font.GothamBold
SubmitBtn.Parent = KeyFrame
Instance.new("UICorner", SubmitBtn).CornerRadius = UDim.new(0, 9)

local StatusKey = Instance.new("TextLabel")
StatusKey.Size = UDim2.new(1, 0, 0, 22)
StatusKey.Position = UDim2.new(0, 0, 0.85, 0)
StatusKey.BackgroundTransparency = 1
StatusKey.Text = ""
StatusKey.TextColor3 = Color3.fromRGB(255, 110, 110)
StatusKey.TextSize = 13
StatusKey.Font = Enum.Font.Gotham
StatusKey.Parent = KeyFrame

-- ========== DISCORD FRAME ==========
local DiscordFrame = Instance.new("Frame")
DiscordFrame.Size = UDim2.new(0, 400, 0, 210)
DiscordFrame.Position = UDim2.new(0.5, -200, 0.5, -105)
DiscordFrame.BackgroundColor3 = Color3.fromRGB(16, 13, 26)
DiscordFrame.BorderSizePixel = 0
DiscordFrame.Visible = false
DiscordFrame.Parent = ScreenGui
Instance.new("UICorner", DiscordFrame).CornerRadius = UDim.new(0, 14)

local DiscStroke = Instance.new("UIStroke", DiscordFrame)
DiscStroke.Color = Color3.fromRGB(130, 80, 230)
DiscStroke.Thickness = 1.6
DiscStroke.Transparency = 0.2

local DiscTitle = Instance.new("TextLabel")
DiscTitle.Size = UDim2.new(1, 0, 0, 45)
DiscTitle.BackgroundTransparency = 1
DiscTitle.Text = "Join our Discord"
DiscTitle.TextColor3 = Color3.fromRGB(220, 200, 255)
DiscTitle.TextSize = 22
DiscTitle.Font = Enum.Font.GothamBold
DiscTitle.Parent = DiscordFrame

local DiscLink = Instance.new("TextLabel")
DiscLink.Size = UDim2.new(0.9, 0, 0, 30)
DiscLink.Position = UDim2.new(0.05, 0, 0.35, 0)
DiscLink.BackgroundTransparency = 1
DiscLink.Text = "https://discord.gg/WfG3RUQXG"
DiscLink.TextColor3 = Color3.fromRGB(140, 180, 255)
DiscLink.TextSize = 15
DiscLink.Font = Enum.Font.Gotham
DiscLink.Parent = DiscordFrame

local CopyBtn = Instance.new("TextButton")
CopyBtn.Size = UDim2.new(0.4, 0, 0, 42)
CopyBtn.Position = UDim2.new(0.1, 0, 0.62, 0)
CopyBtn.BackgroundColor3 = Color3.fromRGB(55, 100, 210)
CopyBtn.Text = "Copy Link"
CopyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CopyBtn.TextSize = 15
CopyBtn.Font = Enum.Font.GothamBold
CopyBtn.Parent = DiscordFrame
Instance.new("UICorner", CopyBtn).CornerRadius = UDim.new(0, 9)

local ContinueBtn = Instance.new("TextButton")
ContinueBtn.Size = UDim2.new(0.4, 0, 0, 42)
ContinueBtn.Position = UDim2.new(0.5, 0, 0.62, 0)
ContinueBtn.BackgroundColor3 = Color3.fromRGB(45, 160, 90)
ContinueBtn.Text = "Continue"
ContinueBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ContinueBtn.TextSize = 15
ContinueBtn.Font = Enum.Font.GothamBold
ContinueBtn.Visible = false
ContinueBtn.Parent = DiscordFrame
Instance.new("UICorner", ContinueBtn).CornerRadius = UDim.new(0, 9)

-- ========== MAIN GUI ==========
local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 640, 0, 440)
MainFrame.Position = UDim2.new(0.5, -320, 0.5, -220)
MainFrame.BackgroundColor3 = Color3.fromRGB(14, 11, 22)
MainFrame.BackgroundTransparency = 0.35
MainFrame.BorderSizePixel = 0
MainFrame.Visible = false
MainFrame.ClipsDescendants = true
MainFrame.Parent = ScreenGui
Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 14)

local MainStroke = Instance.new("UIStroke", MainFrame)
MainStroke.Color = Color3.fromRGB(110, 70, 200)
MainStroke.Thickness = 1.6
MainStroke.Transparency = 0.25

-- Hide / Open Button
local HideShow = Instance.new("TextButton")
HideShow.Name = "HideShow"
HideShow.Size = UDim2.new(0, 58, 0, 38)
HideShow.Position = UDim2.new(0, 15, 0.5, -19)
HideShow.BackgroundColor3 = Color3.fromRGB(0, 165, 85)
HideShow.Text = "Hide"
HideShow.TextColor3 = Color3.fromRGB(255, 255, 255)
HideShow.TextSize = 14
HideShow.Font = Enum.Font.GothamBold
HideShow.Visible = false
HideShow.Parent = ScreenGui
Instance.new("UICorner", HideShow).CornerRadius = UDim.new(0, 9)

local isHidden = false
HideShow.MouseButton1Click:Connect(function()
    if not isHidden then
        TweenService:Create(MainFrame, TweenInfo.new(0.28), {BackgroundTransparency = 1}):Play()
        task.wait(0.28)
        MainFrame.Visible = false
        HideShow.Text = "Open"
        HideShow.BackgroundColor3 = Color3.fromRGB(50, 110, 210)
        isHidden = true
    else
        MainFrame.Visible = true
        TweenService:Create(MainFrame, TweenInfo.new(0.28), {BackgroundTransparency = 0.35}):Play()
        HideShow.Text = "Hide"
        HideShow.BackgroundColor3 = Color3.fromRGB(0, 165, 85)
        isHidden = false
    end
end)

-- Sidebar
local Sidebar = Instance.new("Frame")
Sidebar.Size = UDim2.new(0, 145, 1, 0)
Sidebar.BackgroundColor3 = Color3.fromRGB(18, 14, 30)
Sidebar.BorderSizePixel = 0
Sidebar.Parent = MainFrame
Instance.new("UICorner", Sidebar).CornerRadius = UDim.new(0, 14)

local SideFix = Instance.new("Frame")
SideFix.Size = UDim2.new(0, 20, 1, 0)
SideFix.Position = UDim2.new(1, -20, 0, 0)
SideFix.BackgroundColor3 = Color3.fromRGB(18, 14, 30)
SideFix.BorderSizePixel = 0
SideFix.Parent = Sidebar

local SideTitle = Instance.new("TextLabel")
SideTitle.Size = UDim2.new(1, 0, 0, 48)
SideTitle.BackgroundTransparency = 1
SideTitle.Text = "Elyx Hub V-2"
SideTitle.TextColor3 = Color3.fromRGB(195, 175, 255)
SideTitle.TextSize = 16
SideTitle.Font = Enum.Font.GothamBold
SideTitle.Parent = Sidebar

local Content = Instance.new("Frame")
Content.Name = "Content"
Content.Size = UDim2.new(1, -155, 1, -20)
Content.Position = UDim2.new(0, 150, 0, 10)
Content.BackgroundTransparency = 1
Content.Parent = MainFrame

local Groups = {}

local function CreateGroup(name)
    local frame = Instance.new("ScrollingFrame")
    frame.Name = name
    frame.Size = UDim2.new(1, 0, 1, 0)
    frame.BackgroundTransparency = 1
    frame.BorderSizePixel = 0
    frame.ScrollBarThickness = 4
    frame.ScrollBarImageColor3 = Color3.fromRGB(120, 90, 200)
    frame.Visible = false
    frame.CanvasSize = UDim2.new(0, 0, 0, 0)
    frame.Parent = Content

    local layout = Instance.new("UIListLayout")
    layout.Padding = UDim.new(0, 8)
    layout.SortOrder = Enum.SortOrder.LayoutOrder
    layout.Parent = frame

    layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        frame.CanvasSize = UDim2.new(0, 0, 0, layout.AbsoluteContentSize.Y + 20)
    end)

    Groups[name] = frame
    return frame
end

local function SwitchGroup(name)
    for n, f in pairs(Groups) do
        f.Visible = (n == name)
    end
end

local function MakeSideBtn(text, order, groupName)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.88, 0, 0, 38)
    btn.Position = UDim2.new(0.06, 0, 0, 55 + (order * 45))
    btn.BackgroundColor3 = Color3.fromRGB(38, 28, 62)
    btn.Text = text
    btn.TextColor3 = Color3.fromRGB(220, 205, 255)
    btn.TextSize = 13
    btn.Font = Enum.Font.GothamBold
    btn.Parent = Sidebar
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 9)

    btn.MouseButton1Click:Connect(function()
        SwitchGroup(groupName)
    end)
end

MakeSideBtn("Private Server", 0, "Private")
MakeSideBtn("Theme", 1, "Theme")
MakeSideBtn("Live Chat", 2, "Chat")
MakeSideBtn("All Scripts", 3, "Scripts")
MakeSideBtn("Settings", 4, "Settings")

-- ===== GROUP 1: PRIVATE SERVER =====
local PrivateGroup = CreateGroup("Private")

local PSTitle = Instance.new("TextLabel")
PSTitle.Size = UDim2.new(1, 0, 0, 32)
PSTitle.BackgroundTransparency = 1
PSTitle.Text = "Private / Low Player Server"
PSTitle.TextColor3 = Color3.fromRGB(220, 200, 255)
PSTitle.TextSize = 18
PSTitle.Font = Enum.Font.GothamBold
PSTitle.Parent = PrivateGroup

local PlayerCountBox = Instance.new("TextBox")
PlayerCountBox.Size = UDim2.new(0.65, 0, 0, 38)
PlayerCountBox.BackgroundColor3 = Color3.fromRGB(28, 22, 45)
PlayerCountBox.Text = "1"
PlayerCountBox.PlaceholderText = "Players (default 1)"
PlayerCountBox.TextColor3 = Color3.fromRGB(255, 255, 255)
PlayerCountBox.TextSize = 15
PlayerCountBox.Font = Enum.Font.Gotham
PlayerCountBox.Parent = PrivateGroup
Instance.new("UICorner", PlayerCountBox).CornerRadius = UDim.new(0, 9)

local FindBtn = Instance.new("TextButton")
FindBtn.Size = UDim2.new(0.65, 0, 0, 42)
FindBtn.BackgroundColor3 = Color3.fromRGB(85, 55, 175)
FindBtn.Text = "Find & Join 1 Player Server"
FindBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
FindBtn.TextSize = 15
FindBtn.Font = Enum.Font.GothamBold
FindBtn.Parent = PrivateGroup
Instance.new("UICorner", FindBtn).CornerRadius = UDim.new(0, 9)

local PSStatus = Instance.new("TextLabel")
PSStatus.Size = UDim2.new(1, 0, 0, 26)
PSStatus.BackgroundTransparency = 1
PSStatus.Text = "Ready"
PSStatus.TextColor3 = Color3.fromRGB(160, 155, 200)
PSStatus.TextSize = 13
PSStatus.Font = Enum.Font.Gotham
PSStatus.Parent = PrivateGroup

FindBtn.MouseButton1Click:Connect(function()
    if not requestFunc then
        PSStatus.Text = "No HTTP support"
        return
    end
    local target = tonumber(PlayerCountBox.Text) or 1
    PSStatus.Text = "Searching for " .. target .. " player server..."
    FindBtn.Text = "Searching..."

    task.spawn(function()
        local found = nil
        local cursor = nil
        for page = 1, 10 do
            local url = "https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"
            if cursor then url = url .. "&cursor=" .. cursor end
            local ok, res = pcall(function()
                return requestFunc({Url = url, Method = "GET"})
            end)
            if ok and res and res.Body then
                local data = HttpService:JSONDecode(res.Body)
                if data and data.data then
                    for _, s in ipairs(data.data) do
                        if s.playing == target and s.playing < s.maxPlayers then
                            found = s
                            break
                        end
                    end
                    cursor = data.nextPageCursor
                    if found or not cursor then break end
                end
            end
            task.wait(0.25)
        end
        if found then
            PSStatus.Text = "Found! Joining..."
            FindBtn.Text = "Joining..."
            pcall(function()
                TeleportService:TeleportToPlaceInstance(game.PlaceId, found.id, LocalPlayer)
            end)
        else
            PSStatus.Text = "No " .. target .. " player server found"
            FindBtn.Text = "Find & Join 1 Player Server"
        end
    end)
end)

-- ===== GROUP 2: THEME =====
local ThemeGroup = CreateGroup("Theme")

local ThemeTitle = Instance.new("TextLabel")
ThemeTitle.Size = UDim2.new(1, 0, 0, 32)
ThemeTitle.BackgroundTransparency = 1
ThemeTitle.Text = "Theme Settings"
ThemeTitle.TextColor3 = Color3.fromRGB(220, 200, 255)
ThemeTitle.TextSize = 18
ThemeTitle.Font = Enum.Font.GothamBold
ThemeTitle.Parent = ThemeGroup

local function MakeColorBtn(name, color)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.9, 0, 0, 38)
    btn.BackgroundColor3 = color
    btn.Text = name
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.TextSize = 14
    btn.Font = Enum.Font.GothamBold
    btn.Parent = ThemeGroup
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 9)
    btn.MouseButton1Click:Connect(function()
        for _, v in pairs(MainFrame:GetDescendants()) do
            if v:IsA("TextLabel") or v:IsA("TextButton") or v:IsA("TextBox") then
                v.TextColor3 = color
            end
        end
    end)
end

MakeColorBtn("Purple", Color3.fromRGB(180, 120, 255))
MakeColorBtn("Blue", Color3.fromRGB(100, 160, 255))
MakeColorBtn("Green", Color3.fromRGB(100, 255, 150))
MakeColorBtn("Pink", Color3.fromRGB(255, 120, 200))
MakeColorBtn("White", Color3.fromRGB(230, 230, 240))

-- ===== GROUP 3: LIVE CHAT (Improved) =====
local ChatGroup = CreateGroup("Chat")

local ChatTitle = Instance.new("TextLabel")
ChatTitle.Size = UDim2.new(1, 0, 0, 30)
ChatTitle.BackgroundTransparency = 1
ChatTitle.Text = "Live Chat  •  Everyone can chat"
ChatTitle.TextColor3 = Color3.fromRGB(220, 200, 255)
ChatTitle.TextSize = 16
ChatTitle.Font = Enum.Font.GothamBold
ChatTitle.Parent = ChatGroup

local ChatLog = Instance.new("ScrollingFrame")
ChatLog.Size = UDim2.new(1, -10, 0, 260)
ChatLog.BackgroundColor3 = Color3.fromRGB(22, 18, 36)
ChatLog.BorderSizePixel = 0
ChatLog.ScrollBarThickness = 4
ChatLog.CanvasSize = UDim2.new(0, 0, 0, 0)
ChatLog.Parent = ChatGroup
Instance.new("UICorner", ChatLog).CornerRadius = UDim.new(0, 10)

local ChatLayout = Instance.new("UIListLayout")
ChatLayout.Padding = UDim.new(0, 5)
ChatLayout.Parent = ChatLog
ChatLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    ChatLog.CanvasSize = UDim2.new(0, 0, 0, ChatLayout.AbsoluteContentSize.Y + 12)
    ChatLog.CanvasPosition = Vector2.new(0, ChatLayout.AbsoluteContentSize.Y)
end)

local ChatInput = Instance.new("TextBox")
ChatInput.Size = UDim2.new(0.72, 0, 0, 38)
ChatInput.BackgroundColor3 = Color3.fromRGB(28, 22, 45)
ChatInput.PlaceholderText = "Type your message..."
ChatInput.Text = ""
ChatInput.TextColor3 = Color3.fromRGB(255, 255, 255)
ChatInput.TextSize = 14
ChatInput.Font = Enum.Font.Gotham
ChatInput.Parent = ChatGroup
Instance.new("UICorner", ChatInput).CornerRadius = UDim.new(0, 9)

local SendBtn = Instance.new("TextButton")
SendBtn.Size = UDim2.new(0.24, 0, 0, 38)
SendBtn.BackgroundColor3 = Color3.fromRGB(90, 55, 185)
SendBtn.Text = "Send"
SendBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
SendBtn.TextSize = 14
SendBtn.Font = Enum.Font.GothamBold
SendBtn.Parent = ChatGroup
Instance.new("UICorner", SendBtn).CornerRadius = UDim.new(0, 9)

-- Owner Announcement (top of screen)
local function ShowOwnerAnnouncement(message)
    local Announcement = Instance.new("Frame")
    Announcement.Size = UDim2.new(0, 480, 0, 55)
    Announcement.Position = UDim2.new(0.5, -240, 0, -70)
    Announcement.BackgroundColor3 = Color3.fromRGB(90, 40, 160)
    Announcement.BorderSizePixel = 0
    Announcement.Parent = ScreenGui
    Instance.new("UICorner", Announcement).CornerRadius = UDim.new(0, 12)

    local AnnStroke = Instance.new("UIStroke", Announcement)
    AnnStroke.Color = Color3.fromRGB(180, 120, 255)
    AnnStroke.Thickness = 1.5

    local AnnText = Instance.new("TextLabel")
    AnnText.Size = UDim2.new(1, -20, 1, 0)
    AnnText.Position = UDim2.new(0, 10, 0, 0)
    AnnText.BackgroundTransparency = 1
    AnnText.Text = "👑 OWNER (Chrt2zx): " .. message
    AnnText.TextColor3 = Color3.fromRGB(255, 255, 255)
    AnnText.TextSize = 16
    AnnText.Font = Enum.Font.GothamBold
    AnnText.TextWrapped = true
    AnnText.Parent = Announcement

    -- Slide down
    TweenService:Create(Announcement, TweenInfo.new(0.45, Enum.EasingStyle.Back), {
        Position = UDim2.new(0.5, -240, 0, 25)
    }):Play()

    -- Wait then fade out
    task.delay(4.5, function()
        TweenService:Create(Announcement, TweenInfo.new(0.5), {
            BackgroundTransparency = 1,
            Position = UDim2.new(0.5, -240, 0, -80)
        }):Play()
        TweenService:Create(AnnText, TweenInfo.new(0.5), {TextTransparency = 1}):Play()
        task.wait(0.55)
        Announcement:Destroy()
    end)
end

local function AddChat(playerName, message, isOwner)
    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, -14, 0, 24)
    label.BackgroundTransparency = 1
    label.TextXAlignment = Enum.TextXAlignment.Left
    label.TextSize = 13
    label.Font = Enum.Font.Gotham
    label.Parent = ChatLog

    if isOwner then
        label.Text = "👑 [OWNER] " .. playerName .. ": " .. message
        label.TextColor3 = Color3.fromRGB(200, 150, 255)
    else
        label.Text = "[" .. playerName .. "]: " .. message
        label.TextColor3 = Color3.fromRGB(200, 195, 230)
    end
end

SendBtn.MouseButton1Click:Connect(function()
    local text = ChatInput.Text
    if text == "" or text:match("^%s*$") then return end

    local isOwner = (LocalPlayer.Name == "Chrt2zx")
    AddChat(LocalPlayer.Name, text, isOwner)

    if isOwner then
        ShowOwnerAnnouncement(text)
    end

    ChatInput.Text = ""
end)

-- ===== GROUP 4: ALL SCRIPTS =====
local ScriptsGroup = CreateGroup("Scripts")

local ScriptsTitle = Instance.new("TextLabel")
ScriptsTitle.Size = UDim2.new(1, 0, 0, 30)
ScriptsTitle.BackgroundTransparency = 1
ScriptsTitle.Text = "All Scripts"
ScriptsTitle.TextColor3 = Color3.fromRGB(220, 200, 255)
ScriptsTitle.TextSize = 18
ScriptsTitle.Font = Enum.Font.GothamBold
ScriptsTitle.Parent = ScriptsGroup

local KeylessTitle = Instance.new("TextLabel")
KeylessTitle.Size = UDim2.new(1, 0, 0, 25)
KeylessTitle.BackgroundTransparency = 1
KeylessTitle.Text = "── Keyless Scripts ──"
KeylessTitle.TextColor3 = Color3.fromRGB(100, 255, 160)
KeylessTitle.TextSize = 14
KeylessTitle.Font = Enum.Font.GothamBold
KeylessTitle.Parent = ScriptsGroup

local KeylessScripts = {
    {"LENON V4", 'loadstring(game:HttpGet("https://raw.githubusercontent.com/lennonxscripts/lennonhubv4/main/stealanegg"))()'},
    {"ANTI CHASE", "loadstring(game:HttpGet'https://pastefy.app/nasHhfko/raw')()"},
    {"ANTI CHASE 2", 'loadstring(game:HttpGet("https://raw.githubusercontent.com/Wzeus-NTH/Wzeusno1/main/Wzeus/nthzz"))()'},
    {"CHILLIE HUB", 'loadstring(game:HttpGet("https://raw.githubusercontent.com/tienkhanh1/spicy/main/Chilli.lua"))()'},
    {"NEW UPDATE LEON THE MULTI SCRIPT", 'loadstring(game:HttpGet("https://raw.githubusercontent.com/n01771542-cmd/faluahub/main/main.lua"))()'},
    {"REZZY", 'loadstring(game:HttpGet("https://raw.githubusercontent.com/Roman666Cabj/Nether/refs/heads/main/RezzyStealAnEgg.lua"))()'},
    {"DECODE HUB", 'loadstring(game:HttpGet("https://raw.githubusercontent.com/ItzYumi/Decode/refs/heads/main/DE%3ACODE.lua", true))()'},
    {"PRIVATE SERVER V2", 'loadstring(game:HttpGet("https://pastefy.app/YoZocJ8O/raw"))()'},
    {"ON HUB", 'loadstring(game:HttpGet("https://raw.githubusercontent.com/davizin713/ONhub/refs/heads/main/script.lua", true))()'},
    {"ZN", 'loadstring(game:HttpGet("https://zeroinhub.com/api/script"))()'},
    {"SOLIX", 'loadstring(game:HttpGet("https://raw.githubusercontent.com/bao8jl/solixhub/main/loader"))()'},
    {"NEW CLOVER HUB", 'loadstring(game:HttpGet("https://cloverhub.app/clover.lua"))()'},
    {"SERVER HOP 1 PLAYER", 'loadstring(game:HttpGet("https://raw.githubusercontent.com/RealBatu20/AI-Scripts-2025/refs/heads/main/LowServerFinderGUI.lua", true))()'},
    {"FOX HUB", 'loadstring(game:HttpGet("https://raw.githubusercontent.com/caomod2077/Script/refs/heads/main/Fn-stealanegg.lua"))()'},
    {"BOBLO V2", 'loadstring(game:HttpGet("https://github.com/bobloscript/scripts/raw/refs/heads/main/opensource_egg", true))()'},
    {"MIRANDA AFK", 'loadstring(game:HttpGet("https://api.luarmor.net/files/v4/loaders/6b07a458832f08b2314f706f14723212.lua"))()'},
    {"Josh Bns", 'loadstring(game:HttpGet("https://raw.githubusercontent.com/Dayvinksthik/Script/refs/heads/main/Games/JoshBNS-Crack.lua"))()'},
    {"Shaders", 'loadstring(game:HttpGet("https://raw.githubusercontent.com/swaggayoung581-sudo/special-computing-machine/refs/heads/main/SAE_HUB_MENU_SKY_ACCESSORY_ANIM_FIXED_FOV_ANIM_COMPACT_SAVE_CONFIG.lua%20(1).txt"))()'},
    {"Anti Hit / Anti Chase", 'loadstring(game:HttpGet("https://gist.githubusercontent.com/virexx55/836653079c73281295d6bfb5c10be5d9/raw/128b0220c9a36354b5c6504c3669f328e5354805/virex.lua"))()'},
    {"Nexora Hub", 'loadstring(game:HttpGet("https://raw.githubusercontent.com/Dayvinksthik/Script/refs/heads/main/Games/JoshBNS-Crack.lua"))()'},
    {"Cat Hub All In One", 'loadstring(game:HttpGet("https://raw.githubusercontent.com/showscript-hub/Script/refs/heads/main/Cat-hub", true))()'},
    {"Pulse Zax", 'loadstring(game:HttpGet("https://raw.githubusercontent.com/PulseZax/Loader/refs/heads/main/.lua"))()'},
    {"Rene Baterbonia", 'loadstring(game:HttpGet("https://raw.githubusercontent.com/sabscrip-arch/srver/refs/heads/main/Stealanegg"))()'},
    {"Lkz Hub", 'loadstring(game:HttpGet("https://raw.githubusercontent.com/LucasggkX/LKZ-Hub/refs/heads/main/Loader.lua"))()'},
    {"Sodium Hub", 'loadstring(game:HttpGet("https://flowauth.net/v1/loaders/74528f064778ab498a9dde47df0e5206.lua"))()'},
    {"Sena Hub", 'loadstring(game:HttpGet("https://senahub.xyz/raw/loader"))()'},
    {"Fyy Hub", 'loadstring(game:HttpGet("https://FyyCommunity.com"))()'},
}

local NeedKeyTitle = Instance.new("TextLabel")
NeedKeyTitle.Size = UDim2.new(1, 0, 0, 25)
NeedKeyTitle.BackgroundTransparency = 1
NeedKeyTitle.Text = "── Need Key Scripts ──"
NeedKeyTitle.TextColor3 = Color3.fromRGB(255, 180, 100)
NeedKeyTitle.TextSize = 14
NeedKeyTitle.Font = Enum.Font.GothamBold
NeedKeyTitle.Parent = ScriptsGroup

local NeedKeyScripts = {
    {"Clover Hub", 'loadstring(game:HttpGet("https://cloverhub.app/clover.lua"))()'},
    {"Ajjans Hub", 'loadstring(game:HttpGet("https://api.luarmor.net/files/v4/loaders/359e97f8618e9008afe5f496184ebb7c.lua"))()'},
    {"Bigfroot Hub", 'loadstring(game:HttpGet("https://raw.githubusercontent.com/hanniii1/Loader/refs/heads/main/BFLoader.lua"))()'},
}

local function MakeScriptBtn(name, code)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(0.95, 0, 0, 36)
    btn.BackgroundColor3 = Color3.fromRGB(42, 32, 68)
    btn.Text = "▶  " .. name
    btn.TextColor3 = Color3.fromRGB(220, 210, 255)
    btn.TextSize = 13
    btn.Font = Enum.Font.Gotham
    btn.TextXAlignment = Enum.TextXAlignment.Left
    btn.Parent = ScriptsGroup
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 8)

    local pad = Instance.new("UIPadding")
    pad.PaddingLeft = UDim.new(0, 12)
    pad.Parent = btn

    btn.MouseButton1Click:Connect(function()
        btn.Text = "Loading..."
        local ok, err = pcall(function()
            loadstring(code)()
        end)
        if ok then
            btn.Text = "✓ Loaded: " .. name
            btn.BackgroundColor3 = Color3.fromRGB(35, 85, 55)
        else
            btn.Text = "✗ Failed: " .. name
            btn.BackgroundColor3 = Color3.fromRGB(110, 40, 40)
            warn("[Elyx Hub] " .. tostring(err))
        end
        task.wait(2)
        btn.Text = "▶  " .. name
        btn.BackgroundColor3 = Color3.fromRGB(42, 32, 68)
    end)
end

for _, s in ipairs(KeylessScripts) do
    MakeScriptBtn(s[1], s[2])
end
for _, s in ipairs(NeedKeyScripts) do
    MakeScriptBtn(s[1], s[2])
end

-- ===== GROUP 5: SETTINGS =====
local SettingsGroup = CreateGroup("Settings")

local SetTitle = Instance.new("TextLabel")
SetTitle.Size = UDim2.new(1, 0, 0, 32)
SetTitle.BackgroundTransparency = 1
SetTitle.Text = "Settings"
SetTitle.TextColor3 = Color3.fromRGB(220, 200, 255)
SetTitle.TextSize = 18
SetTitle.Font = Enum.Font.GothamBold
SetTitle.Parent = SettingsGroup

local CloseMain = Instance.new("TextButton")
CloseMain.Size = UDim2.new(0.7, 0, 0, 42)
CloseMain.BackgroundColor3 = Color3.fromRGB(165, 40, 55)
CloseMain.Text = "Close Hub Completely"
CloseMain.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseMain.TextSize = 15
CloseMain.Font = Enum.Font.GothamBold
CloseMain.Parent = SettingsGroup
Instance.new("UICorner", CloseMain).CornerRadius = UDim.new(0, 9)

CloseMain.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- Dragging
local function MakeDraggable(frame)
    local dragging, dragStart, startPos
    frame.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = frame.Position
        end
    end)
    frame.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
    UserInputService.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = input.Position - dragStart
            frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
end

MakeDraggable(MainFrame)
MakeDraggable(HideShow)

-- KEY LOGIC (Updated Key: Elyx_Hub)
SubmitBtn.MouseButton1Click:Connect(function()
    if KeyBox.Text == "Elyx_Hub" then
        StatusKey.Text = "Correct!"
        StatusKey.TextColor3 = Color3.fromRGB(100, 255, 150)
        task.wait(0.55)
        KeyFrame:Destroy()
        DiscordFrame.Visible = true
    else
        StatusKey.Text = "Wrong key!"
        StatusKey.TextColor3 = Color3.fromRGB(255, 100, 100)
    end
end)

CopyBtn.MouseButton1Click:Connect(function()
    pcall(function()
        setclipboard("https://discord.gg/WfG3RUQXG")
    end)
    CopyBtn.Text = "Copied!"
    ContinueBtn.Visible = true
end)

ContinueBtn.MouseButton1Click:Connect(function()
    DiscordFrame:Destroy()
    MainFrame.Visible = true
    HideShow.Visible = true
    SwitchGroup("Private")
end)

print("[All Script Elyx Hub V-2] Loaded - Key: Elyx_Hub")
