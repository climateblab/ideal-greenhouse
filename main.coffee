# $C \frac{dT_s}{dt} = \frac{1}{4}(1-\alpha_p)S_0 -\sigma (1-\epsilon/2) T_s^4$

S0 = 1366 # $W/m^2$ (from sunlight)
sigma = 5.67e-8 # $W/m^2/K^4$
epsilon = 0.78 # $\epsilon$=0.80 for doubled $CO_2$
a = 0.3 # $\alpha_p$
C = 14 # $W years/ m^2 K$ <a href="http://www.ecd.bnl.gov/steve/pubs/HeatCapacity.pdf">Earth's heat capacity</a>

f = (t, y, C, ap, S, si, ep) -> 1/C*(.25*(1-ap)*S-si*(1-ep/2)*y.pow(4))
{rk, ode} = $blab.ode #; Runge Kutta. Click to see imported functions
t = linspace 0, 50, 100 #; years
Ts = ode(rk[2], f, t, [0], C, a, S0, sigma, epsilon) #;
# steady state temperature
Ts[Ts.length-1] 

plot t, (Ts).T,
    xlabel: "t (years)"
    ylabel: "temperature (K)"
    height: 170
    series: 
        shadowSize: 0
        color: "black"
        lines: lineWidth: 1


