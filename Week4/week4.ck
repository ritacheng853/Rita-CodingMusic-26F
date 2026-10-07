SndBuf mySound => Pan2 p => dac;

Gain master => dac;
SndBuf kick => master;
SndBuf snare => master;
SndBuf hihat => master;

//main sound
me.dir() + "/audio/cowbell_01.wav" => mySound.read;
me.dir() + "/audio/kick_01.wav" => kick.read;
me.dir() + "/audio/snare_01.wav" => snare.read;
me.dir() + "/audio/hihat_01.wav" => hihat.read;

.4 => mySound.gain;
.5 => master.gain;

.8 => kick.gain;
.5 => snare.gain;
.2 => hihat.gain;


.55 => mySound.rate;
0 => mySound.pos;
750::ms => now;

.65 => mySound.rate;
0 => mySound.pos;
750::ms => now;

.58 => mySound.rate;
0 => mySound.pos;
750::ms => now;

.50 => mySound.rate;
0 => mySound.pos;
750::ms => now;

0 => int counter;

while(true)
{
    counter % 4 => int beat;

    if(beat == 0)
    {
        0 => kick.pos;
    }

    if(beat == 1)
    {
        0 => hihat.pos;
    }

    if(beat == 2)
    {
        0 => snare.pos;
    }

    if(beat == 3)
    {
        0 => hihat.pos;
    }

    counter++;

    500::ms => now;
}