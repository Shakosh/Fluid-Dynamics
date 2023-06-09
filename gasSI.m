function [value,unit] = gasSI(gas, property)
    
    filename = 'gasSI.csv';

    opts = detectImportOptions(filename);
    opts.VariableNamingRule = 'preserve';
    dataTable = readtable(filename, opts);
    
    dataTable.Properties.RowNames = dataTable.gas;
    dataTable.gas = [];

    value = dataTable{gas, property};
    
    switch property
        case 'symbol'
            unit = 'unitless';
        case 'molecular_mass'
            unit = 'kg/mol';
        case 'gamma'
            unit = 'unitless';
        case 'R'
            unit = 'N*m/kg*K';
        case 'cp'
            unit = 'J/kg*K';
        case 'cv'
            unit = 'J/kg*K';
        case 'mu'
            unit = 'N*s/m^2';
        case 'Tc'
            unit = 'K';
        case 'pc'
            unit = 'MPa';
        otherwise
            unit = '';
    end

end

