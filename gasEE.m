function [value,unit] = gasEE(gas, property)

    filename = 'gasEE.csv';

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
            unit = 'put units here';
        case 'gamma'
            unit = 'unitless';
        case 'R'
            unit = 'lbf*ft/lbm*R';
        case 'cp'
            unit = 'Btu/lbm*R';
        case 'cv'
            unit = 'Btu/lbm*R';
        case 'mu'
            unit = 'lbf*s/ft^2';
        case 'Tc'
            unit = 'R';
        case 'pc'
            unit = 'psia';
        otherwise
            unit = '';
    end

end

