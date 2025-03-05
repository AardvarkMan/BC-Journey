controladdin Ard_WebCamControl
{
    HorizontalStretch = true;
    HorizontalShrink = true;
    MinimumWidth = 250;
    MinimumHeight = 500;
    
    // The Scripts property can reference both external and local scripts.
    Scripts = 'https://cdnjs.cloudflare.com/ajax/libs/knockout/3.5.1/knockout-min.js', 'js/main.js';

    // The StartupScript is a special script that the web client calls once the page is loaded.
    StartupScript = 'js/startup.js';

    event OnControlAddInReady();
    event CaptureImage();

    procedure InitializeControl(url: text);

    // The procedure declarations specify what JavaScript methods could be called from AL.
    // In main.js code, there should be a global function CallJavaScript(i,s,d,c) {Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('CallBack', [i, s, d, c]);}
    procedure CallJavaScript(i: integer; s: text; d: decimal; c: char);

    // The event declarations specify what callbacks could be raised from JavaScript by using the webclient API:
    // Microsoft.Dynamics.NAV.InvokeExtensibilityMethod('CallBack', [42, 'some text', 5.8, 'c'])
    event Callback(i: integer; s: text; d: decimal; c: char);
}