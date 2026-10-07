<<<"Rita - Week2">>>;

// sound network
TriOsc s => dac;
//set volume to 0.6
0.6 => s.gain;
220 => s.freq;
1::second => now;

while(true)
{
    440 => s.freq;
    .5::second => now;

    620 => s.freq;
    .5::second => now;

    880 => s.freq;
    1::second => now;
}