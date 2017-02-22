function varargout = GUI(varargin)
% GUI MATLAB code for GUI.fig
%      GUI, by itself, creates a new GUI or raises the existing
%      singleton*.
%
%      H = GUI returns the handle to a new GUI or the handle to
%      the existing singleton*.
%
%      GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI.M with the given input arguments.
%
%      GUI('Property','Value',...) creates a new GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI

% Last Modified by GUIDE v2.5 26-Dec-2016 12:16:03

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_OutputFcn, ...
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


% --- Executes just before GUI is made visible.
function GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI (see VARARGIN)

% Choose default command line output for GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in browse.
function browse_Callback(hObject, eventdata, handles)
% hObject    handle to browse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img;
[filename filepath] = uigetfile('*.jpg');
img = imread([filepath filename]);
% global [m,n,o] = size(img);
axes(handles.gambar1);
imshow(img);



% --- Executes on button press in darken.
function darken_Callback(hObject, eventdata, handles)
% hObject    handle to darken (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img;
img = img-10;
axes(handles.gambar2);
imshow(img);


% --- Executes on button press in clear.
function clear_Callback(hObject, eventdata, handles)
% hObject    handle to clear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% axes(handles.gambar1);
% hold off;
cla (handles.gambar2);



% --- Executes on button press in brighten.
function brighten_Callback(hObject, eventdata, handles)
% hObject    handle to brighten (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img;
img = img+10;
axes(handles.gambar2);
imshow(img);


% --- Executes on button press in Zoom_Out.
function Zoom_Out_Callback(hObject, eventdata, handles)
% hObject    handle to Zoom_Out (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img;
figure, imshow(img);
figure, imshow(zoomOut(img));

% --- Executes on button press in Zoom_In.
function Zoom_In_Callback(hObject, eventdata, handles)
% hObject    handle to Zoom_In (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img;
axes(handles.gambar2);
figure, imshow(img);
figure, imshow(zoomIn(img,2));



% --- Executes on button press in Save_Image.
function Save_Image_Callback(hObject, eventdata, handles)
% hObject    handle to Save_Image (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.gambar2);
[FileName, PathName] = uiputfile('*.jpg', 'Save As');
Name = fullfile(PathName, FileName);
imwrite(frame2im(getframe(handles.gambar2)), Name, 'jpg');


% --- Executes on button press in Grayscale.
function Grayscale_Callback(hObject, eventdata, handles)
% hObject    handle to Grayscale (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img;
axes(handles.gambar2);
imshow(grayscale(img));


% --- Executes on button press in Histogram.
function Histogram_Callback(hObject, eventdata, handles)
% hObject    handle to Histogram (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global  img;
[countR countG countB] = histogram(img);
x = 0:255;
axes(handles.gambar2);
plot(x, countR, 'Red', x, countG, 'Green', x, countB, 'Blue');


% --- Executes on button press in Warping.
function Warping_Callback(hObject, eventdata, handles)
% hObject    handle to Warping (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img;
tform = maketform('affine', [cos(30) sin(30) 0; -sin(30) cos(30) 0; 0 0 1]);
A = imtransform(img, tform);
axes(handles.gambar2);
imshow(A);


% --- Executes on button press in rotate90.
function rotate90_Callback(hObject, eventdata, handles)
% hObject    handle to rotate90 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img;
axes(handles.gambar2);
imshow(rotate90(img));


% --- Executes on button press in rotate180.
function rotate180_Callback(hObject, eventdata, handles)
% hObject    handle to rotate180 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img;
axes(handles.gambar2);
imshow(rotate180(img));

% --- Executes on button press in rotate270.
function rotate270_Callback(hObject, eventdata, handles)
% hObject    handle to rotate270 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img;
axes(handles.gambar2);
imshow(rotate270(img));


% --- Executes on button press in convolution.
function convolution_Callback(hObject, eventdata, handles)
% hObject    handle to convolution (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img;
axes(handles.gambar2);
imshow(Konvolusi(img));
% imshow(c);


% --- Executes on button press in black_white.
function black_white_Callback(hObject, eventdata, handles)
% hObject    handle to black_white (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img;
axes(handles.gambar2);
imshow(BW(img));


% --- Executes on button press in Blur.
function Blur_Callback(hObject, eventdata, handles)
% hObject    handle to Blur (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img;
axes(handles.gambar2);
imshow(Blurring(img));


% --- Executes on button press in Flip_Vertical.
function Flip_Vertical_Callback(hObject, eventdata, handles)
% hObject    handle to Flip_Vertical (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img;
axes(handles.gambar2);
imshow(Flip_Vertical(img));

% --- Executes on button press in Flip_Horizontal.
function Flip_Horizontal_Callback(hObject, eventdata, handles)
% hObject    handle to Flip_Horizontal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img;
axes(handles.gambar2);
imshow(Flip_Horizontal(img));


% --- Executes on button press in mean_filtering.
function mean_filtering_Callback(hObject, eventdata, handles)
% hObject    handle to mean_filtering (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img;
axes(handles.gambar2);
imshow(Mean_Filtering(img));

% --- Executes on button press in modus_filtering.
function modus_filtering_Callback(hObject, eventdata, handles)
% hObject    handle to modus_filtering (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img;
axes(handles.gambar2);
imshow(Modus_Filtering(img));


% --- Executes on button press in dilasi.
function dilasi_Callback(hObject, eventdata, handles)
% hObject    handle to dilasi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img;
axes(handles.gambar2);
imshow(dilasi(img));


% --- Executes on button press in erosi.
function erosi_Callback(hObject, eventdata, handles)
% hObject    handle to erosi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global img;
axes(handles.gambar2);
imshow(erosi(img));
