function T = TemperatureCurve(step)

if step <= 8000000
    T = 273 + step / 10000;
else
    T = 273 + 800;
end