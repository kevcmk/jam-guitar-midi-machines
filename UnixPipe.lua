-- Documentation here:
-- https://www.jamorigin.com/products/midi-machine/

--[[
    
Getting started. On UNIX machines, you can side-step 
the (finicky) IAC MIDI Bus by directly piping MIDI data
to a named pipe. To create one, use the following command:

    mkfifo /tmp/midi_guitar_pipe

After which you might write some Python3 that looks like:

    with open("/tmp/midi_guitar_pipe") as f:
        os.set_blocking(f.fileno(), False)
        while True:
            time.sleep(0.001)
            for msg in f.readlines():
                ... 
--]]

function OnAfterTouch(channel, pitch, velocity)
	fd:write(os.time(os.date("!*t")), ",aftertouch,", pitch, ",", velocity, "\n")
	fd:flush()
end

function OnNote(channel, pitch, velocity)
	fd:write(os.time(os.date("!*t")), ",note,", pitch, ",", velocity, "\n")
	fd:flush()
end

function OnStart(info)
	info.description = "This machine wil emit Notes and Aftertouches to a UNIX file handle."
	info.link = "https://github.com/kevcmk/jam-guitar-midi-machines"

    fd = io.open("/tmp/midi_guitar_pipe", "a")
end

function OnStop()
    fd:close()
end
