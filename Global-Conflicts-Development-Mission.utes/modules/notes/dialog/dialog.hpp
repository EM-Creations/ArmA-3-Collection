class GVAR(UI)
{
    idd = LN_DIALOG;
    movingEnable = true;
    enableSimulation = true;

    class ControlsBackground
    {
        class MainBackground: GVAR(RscUIBack)
        {
            x = lnBG_X;
            y = lnBG_Y;
            w = lnTotal_W;
            h = lnBG_H;
        };

        class Notepad: GVAR(RscUIBack)
        {
            idc = LN_NOTEPAD;

            x = lnBG_X + lnSpacing_X;
            y = lnBG_Y + lnSpacing_Y;
            w = lnTotal_W - (2 * lnSpacing_X);
            h = lnBG_H - (3 * lnSpacing_Y + lnButton_H);

            style = ST_PICTURE;
        };

        class TopBar: GVAR(RscUIBack)
        {
            idc = LN_TITLE;

            x = lnTotal_X;
            y = lnTotal_Y;
            w = lnTotal_W;
            h = lnButton_H;

            moving = true;
            sizeEx = lnButton_textSize;
            style = ST_LEFT;
            colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0])",1};
        };
    };

    class Controls
    {
        class CloseButton: GVAR(RscCloseButton)
        {
            idc = LN_CLOSEBUTTON;

            x = (lnTotal_X + lnTotal_W) - (lnCloseButton_W + lnSpacing_X);
            y = lnTotal_Y + lnSpacing_Y;
            w = lnCloseButton_W;
            h = lnCloseButton_H;
        };

        class Button1: GVAR(RscButton)
        {
            idc = LN_BUTTON1;

            x = (lnTotal_X + lnTotal_W) - (2*lnButton_W + 2*lnSpacing_X);
            y = (lnTotal_Y + lnTotal_H) - (lnSpacing_Y + lnButton_H);
            w = lnButton_W;
            h = lnButton_H;
        };

        class Button2: GVAR(RscButton)
        {
            idc = LN_BUTTON2;

            x = (lnTotal_X + lnTotal_W) - (lnButton_W + lnSpacing_X);
            y = (lnTotal_Y + lnTotal_H) - (lnSpacing_Y + lnButton_H);
            w = lnButton_W;
            h = lnButton_H;
        };

        class Button3: GVAR(RscButton)
        {
            idc = LN_BUTTON3;

            x = (lnTotal_X + lnTotal_W) - (3*lnButton_W + 3*lnSpacing_X);
            y = (lnTotal_Y + lnTotal_H) - (lnSpacing_Y + lnButton_H);
            w = lnButton_W;
            h = lnButton_H;
        };
    };
};


class GVAR(write): GVAR(UI)
{
    class ControlsBackground: ControlsBackground
    {
        class MainBackground: MainBackground {};
        class Notepad: Notepad {};

        class TopBar: TopBar
        {
            text = "WRITE NOTE";
        };
    };

    class Controls: Controls
    {
        class EditBox: GVAR(RscEditBox)
        {
            idc = LN_EDITBOX;
            x = lnTotal_X + lnPadding_X;
            y = lnBG_Y + 1.14*lnPadding_Y + lnButton_H;
            w = lnTotal_W - lnPadding_X - lnPadding_X;
            h = lnBG_H - 1.14*lnPadding_Y - (2*lnSpacing_Y + 3*lnButton_H);

            onKeyUp = QUOTE(params [ARR_3('_ctrl','_key','_shift')]; if ((_key isEqualTo 28 || _key isEqualTo 156) and !_shift) then {[] call FUNC(enterHint});)
        };

        class CloseButton: CloseButton {};

        class Button1: Button1
        {
            text = "SAVE";
            action= QUOTE([] call FUNC(uiSave); closeDialog 0);
        };

        class Button2: Button2
        {
            text = "DROP";
            action = QUOTE([] call FUNC(uiDrop); closeDialog 0);
        };
    };
};

class GVAR(read): GVAR(UI)
{
    class ControlsBackground: ControlsBackground
    {
        class MainBackground: MainBackground {};
        class Notepad: Notepad {};

        class TopBar: TopBar
        {
            text = "READ NOTE";
        };
    };

    class Controls: Controls
    {
        class TextBox: GVAR(RscText)
        {
            idc = LN_TEXTBOX;
            x = lnTotal_X + lnPadding_X;
            y = lnBG_Y + 1.14*lnPadding_Y + lnButton_H;
            w = lnTotal_W - lnPadding_X - lnPadding_X;
            h = lnBG_H - 1.14*lnPadding_Y - (2*lnSpacing_Y + 3*lnButton_H);
        };

        class CloseButton: CloseButton {};

        class Button1: Button1 {
            text = "DESTROY";
            action = QUOTE([] call FUNC(destroyNote); closeDialog 0);
        };

        class Button2: Button2 {
            text = "DROP";
            action = QUOTE([] call FUNC(uiTakeDrop); closeDialog 0);
        };

        class Button3: Button3 {
            text = "INSPECT";
            action = QUOTE([] call FUNC(inspectNote));
        };
    };
};
