-- Documentation here:
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
    --]]
    
    -- Refers to global io
	for i, n in ipairs(notes) do
        fd:write(os.time(os.date("!*t")), ",", n.pitch, ",", n.velocity, "\n")
	end
	
	fd:flush()
end

function OnStart(info)
	-- assign a description to be displayed in the header
	info.description = "This machine will log the number of notes used."
	info.link = "http://jamorigin.com/midi-machine"
	
    -- Read Getting Started up to to see how to use this.
    fd = io.open("/tmp/midi_guitar_pipe", "a")
end


