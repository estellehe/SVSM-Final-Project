function varargout = simulation2(varargin)
% SIMULATION2 MATLAB code for simulation2.fig
%      SIMULATION2, by itself, creates a new SIMULATION2 or raises the existing
%      singleton*.
%
%      H = SIMULATION2 returns the handle to a new SIMULATION2 or the handle to
%      the existing singleton*.
%
%      SIMULATION2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SIMULATION2.M with the given input arguments.
%
%      SIMULATION2('Property','Value',...) creates a new SIMULATION2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before simulation2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to simulation2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help simulation2

% Last Modified by GUIDE v2.5 20-Jul-2015 10:19:00

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @simulation2_OpeningFcn, ...
                   'gui_OutputFcn',  @simulation2_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before simulation2 is made visible.
function simulation2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to simulation2 (see VARARGIN)

% Choose default command line output for simulation2
handles = simulation2_Reset(hObject, handles);

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes simulation2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = simulation2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

function handles = simulation2_Reset(hObject, handles)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to simulation2 (see VARARGIN)

% Choose default command line output for simulation2
handles.output = hObject;


% constant
handles.den = 1.229;
handles.g = 9.81;
handles.mass = [];
handles.tvel = [];


% input
handles.ar = str2double(get(handles.arTextBox,'String'));
handles.coed = str2double(get(handles.coedTextBox,'String'));
handles.vt = str2double(get(handles.vtTextBox,'String'));
handles.fmax = str2double(get(handles.fmaxTextBox,'String'));
handles.vlim = 0.1*handles.vt;

while handles.vt>=handles.vlim
    handles.drag = 0.5*handles.den*handles.ar*handles.coed*handles.vt^2;
    handles.gravi = handles.drag;
    handles.m = handles.gravi/handles.g;
    handles.mass = [handles.mass;handles.m];
    handles.tvel = [handles.tvel;handles.vt];
    handles.vt=handles.vt-0.001;
end








function fmaxTextBox_Callback(hObject, eventdata, handles)
% hObject    handle to fmaxTextBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of fmaxTextBox as text
%        str2double(get(hObject,'String')) returns contents of fmaxTextBox as a double
handles = simulation2_Reset(hObject, handles);
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function fmaxTextBox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to fmaxTextBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function coedTextBox_Callback(hObject, eventdata, handles)
% hObject    handle to coedTextBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of coedTextBox as text
%        str2double(get(hObject,'String')) returns contents of coedTextBox as a double
handles = simulation2_Reset(hObject, handles);
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function coedTextBox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to coedTextBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function vtTextBox_Callback(hObject, eventdata, handles)
% hObject    handle to vtTextBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of vtTextBox as text
%        str2double(get(hObject,'String')) returns contents of vtTextBox as a double
handles = simulation2_Reset(hObject, handles);
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function vtTextBox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to vtTextBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in graphButton.
function graphButton_Callback(hObject, eventdata, handles)
% hObject    handle to graphButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

plot(handles.graph, handles.mass, handles.tvel);
hold on
plot(handles.graph, handles.mass, handles.tvel2);
xlabel('Mass(kg)');
ylabel('Terminal Velocity (m/s)');
legend('Drag Formula', 'Impulse Calculator');
set(handles.graph, 'YLim', [0, 50])







function arTextBox_Callback(hObject, eventdata, handles)
% hObject    handle to arTextBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of arTextBox as text
%        str2double(get(hObject,'String')) returns contents of arTextBox as a double
handles = simulation2_Reset(hObject, handles);
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function arTextBox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to arTextBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes when selected object is changed in settingGroup.
function settingGroup_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in settingGroup 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



if hObject == handles.grassButton
    handles.tgrass = 0.011625;
    handles.fmax = str2double(get(handles.fmaxTextBox,'String'));
    handles.tvel2 = [];
    for i = 1:length(handles.mass)
        handles.m = handles.mass(i, 1);
        handles.imp = handles.fmax*handles.tgrass/3;
        handles.tv2 = handles.imp/handles.m;
        handles.tvel2 = [handles.tvel2;handles.tv2];
    end
      
    
elseif hObject == handles.concretButton
    handles.tground = 0.004022;
    handles.fmax = str2double(get(handles.fmaxTextBox,'String'));
    handles.tvel2 = [];
    for i = 1:length(handles.mass)
        handles.m = handles.mass(i, 1);
        handles.imp = handles.fmax*handles.tground/2;
        handles.tv2 = handles.imp/handles.m;
        handles.tvel2 = [handles.tvel2;handles.tv2];
    end

end
guidata(hObject, handles);


% --- Executes on button press in resetButton.
function resetButton_Callback(hObject, eventdata, handles)
% hObject    handle to resetButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

set(handles.arTextBox,'String','');
set(handles.coedTextBox,'String','1.8');
set(handles.vtTextBox,'String','');
set(handles.fmaxTextBox,'String','');


reset(handles.settingGroup)
cla(handles.graph)

handles = simulation2_Reset(hObject, handles);
guidata(hObject, handles);
