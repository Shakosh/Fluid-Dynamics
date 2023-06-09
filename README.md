`Isentropic Flow, Normal Shock, Fanno Flow, and Rayleigh Flow Parameter Tables replaced by:`
- tables() 
input arguments: table as a string (isen,norm,fan,ray), variable you have as a string, variable you have as a value, variable you want as a string | Example: T1_Tt1 = tables('isen','M',M1,'T_Tt')
Note: will output 2 values in a 1x2 matrix if there are two possible answers

`Properties of gasses EE and SI replaced by:`
- gasEE()  
- gasSI()
input arguments: gas as a string, property as a string. Example: gasSI('air','cp') 
Note: can output units as well by doing: [cp,units] = gasSI('air','cp')

`Figure AD1 replaced by:`
- gettheta() input arguments: delta, M1
- getdelta() input arguments: theta, M1
- getM1()    input arguments: theta, delta