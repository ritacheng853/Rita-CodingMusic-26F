<<< "Rita - Week2" >>>;


// Integer/variable
{
    int a;

    2 => a;
    20 *=> a;

    <<< "a =", a >>>;
}


{
    SinOsc s => dac;

    261.0 => float myFreq;
    0.6 => float myVol;

    myFreq => s.freq;
    myVol => s.gain;

    2::second => now;

    0 => s.gain;
}


// if / else example
{
    SinOsc s => dac;

    222 => s.freq;
    0.2 => s.gain;

    0 => int chance;

    if( chance == 1 )
    {
        3::second => now;
    }
    else
    {
        440 => s.freq;
        3::second => now;
    }

    0 => s.gain;
}


// now example
<<< "now:", now >>>;
<<< "now in second:", now / second >>>;

3::second => now;

<<< "NEW now:", now / second >>>;


// countdown
now + 4::second => time later;

while( now < later )
{
    <<< "time left:", (later - now) / second >>>;
    1::second => now;
}


// random frequency
{
    SinOsc foo => dac;
    0.2 => foo.gain;

    now + 4::second => time endRand;

    while( now < endRand )
    {
        Math.random2f(30, 1000) => foo.freq;
        320::ms => now;
    }

    0 => foo.gain;
}


// loop rising
{
    SinOsc s => dac;
    0.2 => s.gain;

    for( 20 => int i; i < 40; i++ )
    {
        <<< i >>>;

        i * 10 => s.freq;

        100::ms => now;
    }

    0 => s.gain;
}


// SinOsc + SqrOsc
{
    SinOsc s => dac;
    SqrOsc t => dac;

    // only s
    0.5 => s.gain;
    0 => t.gain;

    for( 100 => int i; i < 500; i++ )
    {
        i => s.freq;
        2::ms => now;
    }

    // only t
    0 => s.gain;
    0.7 => t.gain;

    for( 100 => int i; i < 500; i++ )
    {
        i => t.freq;
        2::ms => now;
    }

    // both together
    0.87 => s.gain;
    1 => t.gain;

    for( 100 => int i; i < 500; i++ )
    {
        i => t.freq;
        i * 2 => s.freq;

        20::ms => now;
    }

    0 => s.gain;
    0 => t.gain;
}


// TriOsc
TriOsc tri => dac;

0.3 => tri.gain;

220 => tri.freq;
2::second => now;

while( true )
{
    440 => tri.freq;
    0.5::second => now;

    325 => tri.freq;
    0.5::second => now;

    280 => tri.freq;
    1::second => now;

    325 => tri.freq;
    1::second => now;

    360 => tri.freq;
    0.5::second => now;
    
    360 => tri.freq;
    0.5::second => now;
    
    280 => tri.freq;
    0.5::second => now;
}