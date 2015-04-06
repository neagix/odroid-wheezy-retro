# Disclaimer #

Do you know that by overclocking your CPU/GPU you can permanently damage it?
If you didn't, now you know it. So don't do it unless you are aware of this possible damage!

Smart people mount fans and have them running when overclocking.

# How to #

Install **cpufreq-utils**:
```
aptitude install cpufreq-utils
```

Then you might want to change CPU frequency this way:

```
cpufreq-set --min 200 Mhz --max 2.0Ghz
```

[Read more](http://www.thinkwiki.org/wiki/How_to_use_cpufrequtils)

# Fan #

Use this nifty tool by mdrjr for automatic fan control:

https://github.com/mdrjr/odroidu2-fan-service