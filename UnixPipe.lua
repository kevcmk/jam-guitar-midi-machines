-- https://www.jamorigin.com/products/midi-machine/

function OnFrame(notes)

    --[[
        The OnFrame function will be called every few milliseconds, or more 
        preciesly once pr audio buffer processed by the audio system. It
        delivers one parameter notes which is an array of all notes 
        currently sounding. For each note n in the array the following 
        data is avaialble. n.pitch is the midi pitch of the note. n.bend 
        is a floating point value in the range [-12..12] giving the current
        bend value of the note. Thus at any time, n.pitch+n.bend is the actual 
        pitch of a note. n.velocity is the velocity of the note. n.duration is 
        the duration the note has been sounding in milliseconds. n.frames is 
        the duration the note has been sounding in number of OnFrame events.
    ]]
	print ("Currently playing", #notes, "notes")
    -- for i, n in ipairs(notes) do
		
	-- end
 end

function OnStart(info)
	-- assign a description to be displayed in the header
	info.description = "This example machine will send out control change streams to respond to brightness and loudness dynamics."
	info.link = "http://jamorigin.com/midi-machine"

	-- create widgets in the user interface for the "cc", "amount" and "inverse" variables
	Knob("loudness_cc", 0, 0, 127, 1)
	Knob("loudness_amount", 0, 0, 2, 0.1)
	List("loudness_inverse", 0, "No", "Yes")

	Knob("brightness_cc", 1, 0, 127, 1)
	Knob("brightness_amount", 1, 0, 2, 0.1)
	List("brightness_inverse", 1, "No", "Yes")
end 