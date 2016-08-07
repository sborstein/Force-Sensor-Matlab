devices = daq.getDevices%get the devices
devices(1)%see devices
sesh = daq.createSession('ni');
addAnalogInputChannel(s,'cDAQ1Mod1', 0, 'Voltage');%set channel 1 x
addAnalogInputChannel(s,'cDAQ1Mod1', 1, 'Voltage');%set channel 2 y
addAnalogInputChannel(s,'cDAQ1Mod1', 2, 'Voltage');%set channel 3 z%
%ch.Range = [-2.5,2.5];%%need this for z, x/y are -5,5. Doesn't seem to be setting properly though

s.Rate=2000; %%%Set the sampling rate. Don't get exactly why it is constrained/changed to certain values
s.DurationInSeconds = 5;%Probably don't want this but rather a trigger?
sesh
%s.Channels(2).Sensitivity = 0.00922;not working, confused about error
ch.ExcitationCurrent = .0020%%set excitation current for all channels to 2 mA

%%%RUN IT%%%
[senseDat,timestamps] = startForeground(sesh);
figure
plot(timestamps,senseDat)

%%%%OUTPUT%%%%
fileName = 'senseDat.mat';%%file to be written
save(fileName,'timestamps','senseDat')%%%write the times and data for each axis
