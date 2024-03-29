function varargout = gui(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_OutputFcn, ...
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

function gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to untitled (see VARARGIN)

% Choose default command line output for untitled
handles.output = hObject;

guidata(hObject, handles);
initialize_gui(hObject, handles, false);


function varargout = gui_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

varargout{1} = handles.output;

function initialize_gui(fig_handle, handles, isreset)
% If the metricdata field is present and the reset flag is false, it means
% we are we are just re-initializing a GUI by calling it from the cmd line
% while it is up. So, bail out as we dont want to reset the data.
if isfield(handles, 'metricdata') && ~isreset
    return;
end

evalin ('base', 'load(''variables.mat'')');
load('variables.mat')
handles.metricdata.PID_P = PID_P;
handles.metricdata.PID_I = PID_I;
handles.metricdata.PID_D = PID_D;
handles.metricdata.H_Numerator = mat2str(H_Numerator);
handles.metricdata.H_Denominator = mat2str(H_Denominator);
handles.metricdata.G_Numerator = mat2str(G_Numerator);
handles.metricdata.G_Denominator = mat2str(G_Denominator);

set(handles.PID_P_setter, 'String', handles.metricdata.PID_P);
set(handles.PID_I_setter,  'String', handles.metricdata.PID_I);
set(handles.PID_D_setter,  'String', handles.metricdata.PID_D);
set(handles.H_Numerator_setter, 'String', handles.metricdata.H_Numerator);
set(handles.H_Denominator_setter,  'String', handles.metricdata.H_Denominator);
set(handles.G_Numerator_setter,  'String', handles.metricdata.G_Numerator);
set(handles.G_Denominator_setter,  'String', handles.metricdata.G_Denominator);

function PID_P_setter_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PID_P_setter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function PID_P_setter_Callback(hObject, eventdata, handles)
% hObject    handle to PID_P_setter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

PID_P = str2double(get(hObject, 'String'));
if isnan(PID_P)
    set(hObject, 'String', 1);
    errordlg('Input must be a integer','Error');
end

handles.metricdata.PID_P = PID_P;
guidata(hObject,handles)

function PID_I_setter_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PID_I_setter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function PID_I_setter_Callback(hObject, eventdata, handles)
% hObject    handle to PID_I_setter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

PID_I = str2double(get(hObject, 'String'));
if isnan(PID_I)
    set(hObject, 'String', 1);
    errordlg('Input must be a integer','Error');
end

handles.metricdata.PID_I = PID_I;
guidata(hObject,handles)

function PID_D_setter_Callback(hObject, eventdata, handles)
% hObject    handle to PID_D_setter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

PID_D = str2double(get(hObject, 'String'));
if isnan(PID_D)
    set(hObject, 'String', 1);
    errordlg('Input must be a integer','Error');
end

handles.metricdata.PID_D = PID_D;
guidata(hObject,handles)

function PID_D_setter_CreateFcn(hObject, eventdata, handles)
% hObject    handle to PID_D_setter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function H_Numerator_setter_Callback(hObject, eventdata, handles)
% hObject    handle to H_Numerator_setter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

H_Numerator = str2mat(get(hObject, 'String'));
if isnan(H_Numerator)
    set(hObject, 'String', 1);
    errordlg('Input must be a integer','Error');
end

handles.metricdata.H_Numerator = H_Numerator;
guidata(hObject,handles)

function H_Numerator_setter_CreateFcn(hObject, eventdata, handles)
% hObject    handle to H_Numerator_setter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function H_Denominator_setter_Callback(hObject, eventdata, handles)
% hObject    handle to H_Denominator_setter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

H_Denominator = str2num(get(hObject, 'String'));
if isnan(H_Denominator)
    set(hObject, 'String', 1);
    errordlg('Input must be a integer','Error');
end

handles.metricdata.H_Numerator = H_Denominator;
guidata(hObject,handles)

function H_Denominator_setter_CreateFcn(hObject, eventdata, handles)
% hObject    handle to H_Denominator_setter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function G_Numerator_setter_Callback(hObject, eventdata, handles)
% hObject    handle to G_Numerator_setter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

G_Numerator = str2num(get(hObject, 'String'));
if isnan(G_Numerator)
    set(hObject, 'String', 1);
    errordlg('Input must be a integer','Error');
end

handles.metricdata.H_Numerator = G_Numerator;
guidata(hObject,handles)

function G_Numerator_setter_CreateFcn(hObject, eventdata, handles)
% hObject    handle to G_Numerator_setter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function G_Denominator_setter_Callback(hObject, eventdata, handles)
% hObject    handle to G_Denominator_setter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

G_Denominator = str2num(get(hObject, 'String'));
if isnan(G_Denominator)
    set(hObject, 'String', 1);
    errordlg('Input must be a integer','Error');
end

handles.metricdata.H_Numerator = G_Denominator;
guidata(hObject,handles)

function G_Denominator_setter_CreateFcn(hObject, eventdata, handles)
% hObject    handle to G_Denominator_setter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function simulink_Callback(hObject, eventdata, handles)
% hObject    handle to simulink (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
load('variables.mat');
PID_P = str2double(get(handles.PID_P_setter, 'String'));
PID_I = str2double(get(handles.PID_I_setter,  'String'));
PID_D = str2double(get(handles.PID_D_setter,  'String'));
H_Numerator = str2num(get(handles.H_Numerator_setter, 'String'));
H_Denominator = str2num(get(handles.H_Denominator_setter,  'String'));
G_Numerator = str2num(get(handles.G_Numerator_setter,  'String'));
G_Denominator = str2num(get(handles.G_Denominator_setter,  'String'));

assignin('base', 'PID_P', PID_P)
assignin('base', 'PID_I', PID_I)
assignin('base', 'PID_D', PID_D)
assignin('base', 'H_Numerator', H_Numerator)
assignin('base', 'H_Denominator', H_Denominator)
assignin('base', 'G_Numerator', G_Numerator)
assignin('base', 'G_Denominator', G_Denominator)

guidata(hObject, handles)
open_system('pid_model.mdl')


% --- Executes on button press in part1.
function part1_Callback(hObject, eventdata, handles)
% hObject    handle to part1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.PID_P_setter, 'String', 17500);
set(handles.PID_I_setter, 'String', 0);
set(handles.PID_D_setter, 'String', 1000);
set(handles.H_Numerator_setter, 'String', 1);
set(handles.H_Denominator_setter, 'String', 1);
set(handles.G_Numerator_setter, 'String', 1);
set(handles.G_Denominator_setter, 'String', '[1 -4 3]');

% --- Executes on button press in part2.
function part2_Callback(hObject, eventdata, handles)
% hObject    handle to part2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.PID_P_setter, 'String', 1000);
set(handles.PID_I_setter, 'String', 0);
set(handles.PID_D_setter, 'String', 800);
set(handles.H_Numerator_setter, 'String', '0.1');
set(handles.H_Denominator_setter, 'String', 1);
set(handles.G_Numerator_setter, 'String', 1);
set(handles.G_Denominator_setter, 'String', '[1 -2 -3]');



% --- Executes on button press in part3.
function part3_Callback(hObject, eventdata, handles)
% hObject    handle to part3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.PID_P_setter, 'String', 1969);
set(handles.PID_I_setter, 'String', 0);
set(handles.PID_D_setter, 'String', 1500);
set(handles.H_Numerator_setter, 'String', '0.1');
set(handles.H_Denominator_setter, 'String', '[1 1]');
set(handles.G_Numerator_setter, 'String', 1);
set(handles.G_Denominator_setter, 'String', '[1 -3]');



