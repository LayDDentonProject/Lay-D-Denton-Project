//=============================================================================
// RFRootWindow.
//
// Root window to do scaling and window mutation.
//
// Created for the Revision Framework, and may be used according to the project license.
//=============================================================================
class FemJCRootWindow extends DeusExRootWindow;

var float HorizontalDivisor; 						// Horizontal divisor for autoscaling code. See: ResizeRoot().
var float VerticalDivisor, VerticalRelaxedDivisor;	// Vertical divisor for autoscaling code. See: ResizeRoot().

var globalconfig bool bUseRFGoalWin;
var globalconfig bool bUseRFMP;

function InitWindow()
{
	Super.InitWindow();
	log("We are initializing" @ Self $ "!", 'DevRF');
}

// ----------------------------------------------------------------------
// MutateNewChild()
//
// When NewChild() is either called on this RootWindow or on an child window,
// this event is called right before the new Window is constructed.
//
// This offers the ability to modify the class of the window created,
// and is an easy way to hook in your substitution window class.
//
// It should be a child of the of the DesignatedWindowClass;
// if not, check twice if code breaks before returning a non subclass.
//
// It is recommended to use a switch block for DesignatedClass.Name as
// this is way faster then ClassIsChildOf() and doesn't interfere with
// someone else using a replacement class.
// ----------------------------------------------------------------------
event MutateNewChild(Window NewParent, out class<Window> DesignatedClass)
{
	local Name oldName;

	oldName = DesignatedClass.Name;

	switch (DesignatedClass.Name)
	{
		
		default:
			break;
	}

	if (oldName != DesignatedClass.Name)
		Log(Self $ ".MutateNewChild: Replaced" @ oldName @ "with" @ DesignatedClass.Name, 'DevRF');
}

// ----------------------------------------------------------------------
// ModifyNewChild()
//
// This is called immediately after a new child window is created,
// but before the child's InitWindow() method is called.
//
// This is a good spot when you just want to edit defaultproperties,
// e.g. like replacing a MenuUIChoice of a config window.
//
// If you need to run code after InitWindow() you should use an own subclass.
// ----------------------------------------------------------------------
event ModifyNewChild(Window NewParent, Window NewKidOnTheBlock)
{
	local bool processed;

	processed = True;

	switch (NewKidOnTheBlock.Class.Name)
	{
		// If using vanilla Display setting screen, then replace some legacy settings with these two.
		
		case 'menuchoice_class':
			MenuChoice_Class(NewKidOnTheBlock).ClassClasses[0] = "FemJC.JCDentonFemale";
			break;
		default:
			processed = False;
	}

	if (processed)
		Log(Self $ ".ModifyNewChild: Modified" @ NewKidOnTheBlock, 'DevRF');
}

// ----------------------------------------------------------------------
// ResizeRoot()
//
// Calculates new RootWindow scale. Override for custom behavior,
// e.g. for conversations or scope view.
// ----------------------------------------------------------------------
event ResizeRoot(Canvas Canvas)
{
	local int ScaleMode, hMult, vMult;
	local PlayerPawnExt P;

	P = GetPlayerPawn();
	if (P != None)
	{
		if (P.XLevel.Outer.Name == '00_Intro')
			ScaleMode = 1;
		else
			ScaleMode = Int(P.GetPropertyText("ScaleMode"));
	}
	else
		ScaleMode = 0;

	// Calculate multipliers
	hMult = Canvas.ClipX/HorizontalDivisor;
	if (ScaleMode == -1)
		vMult = Canvas.ClipY / VerticalRelaxedDivisor;
	else
		vMult = Canvas.ClipY / VerticalDivisor;

	if (hMult < 1)
		hMult = 1;
	if (vMult < 1)
		vMult = 1;

	if (hMult < vMult)
		vMult = hMult;
	else if (hMult > vMult)
		hMult = vMult;

	// Override scale
	if (ScaleMode > 0 && ScaleMode<hMult && ScaleMode < vMult)
	{
		hMult = ScaleMode;
		vMult = ScaleMode;
	}

	// Apply initial settings.
	ApplyRootWindowSettings(hMult, vMult, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, HALIGN_Left, VALIGN_Top, Canvas.ClipX / hMult, Canvas.ClipY / vMult);
	if (hardcodedWidth != width || hardcodedHeight != height)
		ConfigureChild(0.0, 0.0, hardcodedWidth, hardcodedHeight);
	ClampMousePosition();
}

// ----------------------------------------------------------------------
// ApplyRootWindowSettings()
//
// Convenience helper for ResizeRoot().
// ----------------------------------------------------------------------
function ApplyRootWindowSettings
(
	int InhMultiplier,
	int InvMultiplier,
	float Inx,
	float Iny,
	float InhMargin0,
	float InhMargin1,
	float InvMargin0,
	float InvMargin1,
	EHAlign InwinHAlign,
	EVAlign InwinVAlign,
	float InhardcodedWidth,
	float InhardcodedHeight
)
{
	SetPropertyText("hMultiplier",     String(InhMultiplier)    );
	SetPropertyText("vMultiplier",     String(InvMultiplier)    );
	SetPropertyText("x",               String(Inx)              );
	SetPropertyText("y",               String(Iny)              );
	SetPropertyText("hMargin0",        String(InhMargin0)       );
	SetPropertyText("hMargin1",        String(InhMargin1)       );
	SetPropertyText("vMargin0",        String(InvMargin0)       );
	SetPropertyText("vMargin1",        String(InvMargin1)       );
	SetPropertyText("winHAlign",       String(InwinHAlign)      );
	SetPropertyText("winVAlign",       String(InwinVAlign)      );
	SetPropertyText("hardcodedWidth",  String(InhardcodedWidth) );
	SetPropertyText("hardcodedHeight", String(InhardcodedHeight));
}

// ----------------------------------------------------------------------
// ClampMousePosition()
//
// Convenience function for clamping mouse position, used by ResizeRoot()
// ----------------------------------------------------------------------
function ClampMousePosition()
{
	SetPropertyText("mouseX", String(FClamp(Float(GetPropertyText("mouseX")), x, x + width - 1.0)));
	SetPropertyText("mouseY", String(FClamp(Float(GetPropertyText("mouseY")), y, y + height - 1.0)));
}

// ----------------------------------------------------------------------
// CustomMessageBox()
//
// Displays a Message box with a specified notify window and ability to
// swap the top window.
// ----------------------------------------------------------------------
function MenuUIMessageBoxWindow CustomMessageBox
(
	Class<MenuUIMessageBoxWindow> MsgBoxClass,
	String MsgTitle,
	String MsgText,
	int MsgBoxMode,
	bool bHideCurrentScreen,
	Window WinNotify,
	optional bool bTopHack
)
{
	local DeusExBaseWindow Temp;
	local MenuUIMessageBoxWindow MsgBox;

	MsgBox = MenuUIMessageBoxWindow(PushWindow(MsgBoxClass, bHideCurrentScreen));

	if (MsgBox != None)
	{
		// Exchange the two topmost windows.
		if (bTopHack && winCount >= 2)
		{
			Temp                 = winStack[winCount-1];
			winStack[winCount-1] = winStack[winCount-2];
			winStack[winCount-2] = Temp;
		}

		if (MsgTitle != "")
			MsgBox.SetTitle(MsgTitle);
		if (MsgText != "")
			MsgBox.SetMessageText(MsgText);

		MsgBox.SetMode(MsgBoxMode);
		MsgBox.SetNotifyWindow(WinNotify);
	}
	return MsgBox;
}

// ----------------------------------------------------------------------------
// ----------------------------------------------------------------------------

defaultproperties
{
     HorizontalDivisor=640.000000
     VerticalDivisor=480.000000
     VerticalRelaxedDivisor=449.000000
     bUseRFGoalWin=True
     bUseRFMP=True
}
