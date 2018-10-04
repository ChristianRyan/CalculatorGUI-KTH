%% Fundamentals for GUI - DO NOT EDIT
function varargout = Calculator(varargin)
% CRYAN MATLAB code for Cryan.fig
%      CRYAN, by itself, creates a new CRYAN or raises the existing
%      singleton*.
%
%      H = CRYAN returns the handle to a new CRYAN or the handle to
%      the existing singleton*.
%
%      CRYAN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CRYAN.M with the given input arguments.
%
%      CRYAN('Property','Value',...) creates a new CRYAN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Calculator_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Calculator_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Cryan

% Last Modified by GUIDE v2.5 29-Mar-2017 22:16:18

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Calculator_OpeningFcn, ...
                   'gui_OutputFcn',  @Calculator_OutputFcn, ...
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

% --- Executes just before Cryan is made visible.
function Calculator_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Cryan (see VARARGIN)

% Choose default command line output for Cryan
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Cryan wait for user response (see UIRESUME)
% uiwait(handles.Cryan);


% --- Outputs from this function are returned to the command line.
function varargout = Calculator_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


%% CRYAN'S GUI

%% Improvements:
% - Multiple decimal numbers.
% - Potential control mechanism for multiple operation inputs.


% --- Executes on button press in ZeroButton.
function ZeroButton_Callback(hObject, eventdata, handles)
% Appends the digit zero on screen.

set(handles.Result, 'string', strcat(get(handles.Result, 'string'),'0')) 


% --- Executes on button press in OneButton.
function OneButton_Callback(hObject, eventdata, handles)
% Appends the digit one on screen.

set(handles.Result, 'string', strcat(get(handles.Result, 'string'),'1')) 


% --- Executes on button press in TwoButton.
function TwoButton_Callback(hObject, eventdata, handles)
% Appends the digit two on screen.

set(handles.Result, 'string', strcat(get(handles.Result, 'string'),'2')) 


% --- Executes on button press in ThreeButton.
function ThreeButton_Callback(hObject, eventdata, handles)
% Appends the digit three on screen.

set(handles.Result, 'string', strcat(get(handles.Result, 'string'),'3')) 


% --- Executes on button press in FourButton.
function FourButton_Callback(hObject, eventdata, handles)
% Appends the digit four on screen.

set(handles.Result, 'string', strcat(get(handles.Result, 'string'),'4')) 


% --- Executes on button press in FiveButton.
function FiveButton_Callback(hObject, eventdata, handles)
% Appends the digit five on screen.

set(handles.Result, 'string', strcat(get(handles.Result, 'string'),'5')) 


% --- Executes on button press in SixButton.
function SixButton_Callback(hObject, eventdata, handles)
% Appends the digit six on screen.

set(handles.Result, 'string', strcat(get(handles.Result, 'string'),'6')) 


% --- Executes on button press in SevenButton.
function SevenButton_Callback(hObject, eventdata, handles)
% Appends the digit seven on screen.

set(handles.Result, 'string', strcat(get(handles.Result, 'string'),'7')) 


% --- Executes on button press in EightButton.
function EightButton_Callback(hObject, eventdata, handles)
% Appends the digit eight on screen.

set(handles.Result, 'string', strcat(get(handles.Result, 'string'),'8'))


% --- Executes on button press in NineButton.
function NineButton_Callback(hObject, eventdata, handles)
% Appends the digit nine on screen.

set(handles.Result, 'string', strcat(get(handles.Result, 'string'),'9')) 


% --- Executes on button press in CButton.
function CButton_Callback(hObject, eventdata, handles)
% Removes all digits from screen
% Wipes all saved data. C = clean.

if isappdata(handles.Result, 'symbol') 
    rmappdata(handles.Result,'symbol');
if isappdata(handles.Result, 'digit')
    rmappdata(handles.Result,'digit');
if isappdata(handles.Result, 'isDecimal')
    rmappdata(handles.Result,'isDecimal');
end, end, end

set(handles.Result, 'string', '') 


% --- Executes on button press in DelButton.
function DelButton_Callback(hObject, eventdata, handles)
% Removes last digit from number.
% Control mechanism in case there are no digits.

text = get(handles.Result, 'string');

if length(text) > 1
    t = text(1:length(text)-1);
    set(handles.Result, 'string', t)
else
     set(handles.Result, 'string', '')
end


% --- Executes on button press in ProcentButton.
function ProcentButton_Callback(hObject, eventdata, handles)
% Converts digit from procent to decimals. 
% Checks if no number is present.

number = str2double(get(handles.Result, 'string'));

if ~isnan(number)
    number = number/100
    set(handles.Result, 'string', number)
end



% --- Executes on button press in DecimalButton.
function DecimalButton_Callback(hObject, eventdata, handles)
% Adds decimal functionality.
% Checks if number is present or not.

text = str2double(get(handles.Result, 'string'));

if ~isappdata(handles.Result, 'isDecimal') && ~isnan(text)
    set(handles.Result, 'string', strcat(get(handles.Result, 'string'),'.'));
    setappdata(handles.Result, 'isDecimal', 'True');
end



% --- Executes on button press in EqualButton.
function EqualButton_Callback(hObject, eventdata, handles)
% Computes computation.

%Retrives number from screen.
onScreenNumber = str2double(get(handles.Result, 'string'));

%Control mechanism for no number present.
if ~isnan(onScreenNumber)

storedNumbers = getappdata(handles.Result, 'digit');
storedNumbers = [storedNumbers, onScreenNumber]; % Retrives stored numbers and appends number on screen.

storedOperations = getappdata(handles.Result, 'symbol'); % Retrives stored operations

% Multiplication/division has higher priority than addition/subtraction
while any(ismember((storedOperations), '*')) || any(ismember((storedOperations), '/'))
    i = 1;
    while length(storedNumbers) > i
        if strcmp(storedOperations(i), '*') % If multiplication was requested.
            calc = storedNumbers(i)*storedNumbers(i+1) % Perform multiplication.
        elseif strcmp(storedOperations(i), '/') % If division was requested.
            calc = storedNumbers(i)/storedNumbers(i+1) % Perform division.
        end
        if strcmp(storedOperations(i), '*') || strcmp(storedOperations(i), '/')
        storedNumbers(i) = calc; % Replace first digit in stored numbers with result of operation of first two.
        storedNumbers(i+1) =  []; % Remove second digit.
        storedOperations(i) =  []; % Remove operation.
        end
        i = i + 1;
    end
end

% In case addition/subtraction is requested. If not, storedoperations will
% be empty and next block will be skipped.
if length(storedOperations) ~= 0
    sum = 0;
    result = 0;
    for i = 1:length(storedOperations)
        storedOperations(i)
        if strcmp(storedOperations(i), '+')
            result = storedNumbers(i) + storedNumbers(i+1);
        elseif strcmp(storedOperations(i), '-')
            result = storedNumbers(i) - storedNumbers(i+1);
        end
        sum = sum + result;
    end
else
    sum = storedNumbers(1);
end

if isappdata(handles.Result, 'symbol') && isappdata(handles.Result, 'digit')
    rmappdata(handles.Result,'symbol'); %Remove stored data, thus eliminating glitches at repeated presses.
    rmappdata(handles.Result,'digit') ; %Remove stored data, thus eliminating glitches at repeated presses.
end

set(handles.Result, 'string', sum)
 
end
     
 
 function Save_data(hObject, eventdata, handles, operation, term)
% Method to save numbers and operations at each operation button press. 

% As there can be an infinite amount of numbers, vectors must be used for storage.
     vectorOfNumbers = []; 
     vectorOfOperations = [];
     
     
 if isappdata(handles.Result, 'symbol') && isappdata(handles.Result, 'digit')
     storedNumbers = getappdata(handles.Result, 'digit');
     storedOperations = getappdata(handles.Result, 'symbol');
     vectorOfNumbers = [storedNumbers, term]
     vectorOfOperations = [storedOperations, operation]
     setappdata(handles.Result, 'symbol', vectorOfOperations); % Stores data in GUI.
     setappdata(handles.Result, 'digit', vectorOfNumbers); % Stores data in GUI.
     if length(vectorOfOperations) > 1 && (strcmp(any(vectorOfOperations), '+') || strcmp(any(vectorOfOperations), '-'))
        EqualButton_Callback(hObject, eventdata, handles)  
     end
 else
     setappdata(handles.Result, 'symbol', operation);
     setappdata(handles.Result, 'digit', term);
 end
 
 
%% Operation Buttons 
 
% --- Executes on button press in MinusButton.
function MinusButton_Callback(hObject, eventdata, handles)
% Saves operation '-' & number on screen.

Save_data(hObject, eventdata, handles, '-', str2double(get(handles.Result, 'string')));

% Finally wipes screen. 

set(handles.Result, 'string', '')
 
% --- Executes on button press in MultiButton.
function MultiButton_Callback(hObject, eventdata, handles)
% Saves operation '*' & number on screen.

Save_data(hObject, eventdata, handles, '*', str2double(get(handles.Result, 'string')));

% Finally wipes screen. 

set(handles.Result, 'string', '')  

% --- Executes on button press in PlusButton.
function PlusButton_Callback(hObject, eventdata, handles)
% Saves operation '+' & number on screen.

Save_data(hObject, eventdata, handles, '+', str2double(get(handles.Result, 'string')));

% Finally wipes screen. 

set(handles.Result, 'string', '')

     
% --- Executes on button press in DivButton.
function DivButton_Callback(hObject, eventdata, handles)
% Saves operation '/' & number on screen.

Save_data(hObject, eventdata, handles, '/', str2double(get(handles.Result, 'string')));

% Finally wipes screen. 

set(handles.Result, 'string', ' ') 

function Result_Callback(hObject, eventdata, handles)
% Useless button used for more user friendly information presentation.