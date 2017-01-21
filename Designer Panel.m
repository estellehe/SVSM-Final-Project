function varargout = simulation(varargin)
% SIMULATION MATLAB code for simulation.fig
%      SIMULATION, by itself, creates a new SIMULATION or raises the existing
%      singleton*.
%
%      H = SIMULATION returns the handle to a new SIMULATION or the handle to
%      the existing singleton*.
%
%      SIMULATION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SIMULATION.M with the given input arguments.
%
%      SIMULATION('Property','Value',...) creates a new SIMULATION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before simulation_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to simulation_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help simulation

% Last Modified by GUIDE v2.5 20-Jul-2015 21:43:04

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @simulation_OpeningFcn, ...
                   'gui_OutputFcn',  @simulation_OutputFcn, ...
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


% --- Executes just before simulation is made visible.
function simulation_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to simulation (see VARARGIN)

% Choose default command line output for simulation
handles = simulation_Reset(hObject, handles);

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes simulation wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = simulation_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

function handles = simulation_Reset(hObject, handles)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to simulation (see VARARGIN)

% Choose default command line output for simulation
handles.output = hObject;

% constant
handles.denV1 = 1.229;
handles.gV1 = 9.81;
handles.areaV1 = [];
handles.tvelV1 = [];


% input
handles.massV1 = str2double(get(handles.massTextBox,'String'));
handles.vtV1 = str2double(get(handles.vtTextBox,'String'));
handles.coedV1 = str2double(get(handles.cdTextBox,'String'));
handles.vlimV1 = 0.1*handles.vtV1;


% calculation
handles.graviV1 = handles.massV1*handles.gV1;
handles.fdragV1 = handles.graviV1;

handles.armaxV1 = handles.fdragV1*2/(handles.denV1*handles.coedV1*handles.vtV1^2);

while handles.vtV1>=handles.vlimV1
    handles.arV1 = handles.fdragV1*2/(handles.denV1*handles.coedV1*handles.vtV1^2);
    handles.areaV1 = [handles.areaV1;handles.arV1];
    handles.tvelV1 = [handles.tvelV1;handles.vtV1];
    handles.vtV1=handles.vtV1-0.001;
end



handles.plot = plot(handles.areaV1,handles.tvelV1);
xlabel('Cross-sectional Area (m^2)');
ylabel('Terminal Velocity (m/s)');









function maxforceTextBox_Callback(hObject, eventdata, handles)
% hObject    handle to maxforceTextBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of maxforceTextBox as text
%        str2double(get(hObject,'String')) returns contents of maxforceTextBox as a double
handles = simulation_Reset(hObject, handles);
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function maxforceTextBox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to maxforceTextBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2


% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function massTextBox_Callback(hObject, eventdata, handles)
% hObject    handle to massTextBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of massTextBox as text
%        str2double(get(hObject,'String')) returns contents of massTextBox as a double
handles = simulation_Reset(hObject, handles);
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function massTextBox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to massTextBox (see GCBO)
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
handles = simulation_Reset(hObject, handles);
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



function timeTextBox_Callback(hObject, eventdata, handles)
% hObject    handle to timeTextBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of timeTextBox as text
%        str2double(get(hObject,'String')) returns contents of timeTextBox as a double
handles = simulation_Reset(hObject, handles);
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function timeTextBox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to timeTextBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function cdTextBox_Callback(hObject, eventdata, handles)
% hObject    handle to cdTextBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of cdTextBox as text
%        str2double(get(hObject,'String')) returns contents of cdTextBox as a double
handles = simulation_Reset(hObject, handles);
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function cdTextBox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to cdTextBox (see GCBO)
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

set(handles.plot,'XData',handles.areaV1,'YData',handles.tvelV1);
set(handles.minTextBox, 'String', num2str(handles.armaxV1));
legend('Drag Formula');



% --- Executes on button press in parachutesimulatorPushButton.
function parachutesimulatorPushButton_Callback(hObject, eventdata, handles)
% hObject    handle to parachutesimulatorPushButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function calmassTextBox_Callback(hObject, eventdata, handles)
% hObject    handle to calmassTextBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of calmassTextBox as text
%        str2double(get(hObject,'String')) returns contents of calmassTextBox as a double


% --- Executes during object creation, after setting all properties.
function calmassTextBox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to calmassTextBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function calresultTextBox_Callback(hObject, eventdata, handles)
% hObject    handle to calresultTextBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of calresultTextBox as text
%        str2double(get(hObject,'String')) returns contents of calresultTextBox as a double


% --- Executes during object creation, after setting all properties.
function calresultTextBox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to calresultTextBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in grassButton.
function grassButton_Callback(hObject, eventdata, handles)
% hObject    handle to grassButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of grassButton


% --- Executes on button press in concretButton.
function concretButton_Callback(hObject, eventdata, handles)
% hObject    handle to concretButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of concretButton


% --- Executes when selected object is changed in settingGroup.
function settingGroup_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in settingGroup 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


%input
handles.massV2 = str2double(get(handles.massTextBox,'String'));
handles.fmaxV2 = str2double(get(handles.maxforceTextBox,'String'));
    
if hObject == handles.grassButton
    %constant
    handles.tgrassV2 = 0.011625;

    handles.impV2 = handles.fmaxV2*handles.tgrassV2/3;
    handles.tvV2 = handles.impV2/handles.massV2;
    
    set(handles.calresultTextBox, 'String', num2str(handles.tvV2))


elseif hObject == handles.concretButton
    %constant
    handles.tgroundV2 = 0.004022;

    handles.impV2 = handles.fmaxV2*handles.tgroundV2/2;
    handles.tvV2 = handles.impV2/handles.massV2;  
    
    set(handles.calresultTextBox, 'String', num2str(handles.tvV2))

end









% --- Executes on button press in calculatorbutton.
function calculatorbutton_Callback(hObject, eventdata, handles)
% hObject    handle to calculatorbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)





% --- Executes during object creation, after setting all properties.
function settingGroup_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uibuttongroup1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on button press in calButton.
function calButton_Callback(hObject, eventdata, handles)
% hObject    handle to calButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)




function minTextBox_Callback(hObject, eventdata, handles)
% hObject    handle to minTextBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of minTextBox as text
%        str2double(get(hObject,'String')) returns contents of minTextBox as a double


% --- Executes during object creation, after setting all properties.
function minTextBox_CreateFcn(hObject, eventdata, handles)
% hObject    handle to minTextBox (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
