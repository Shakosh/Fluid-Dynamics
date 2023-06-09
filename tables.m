function value = tables(table_name, given_item, given_value, item_wanted)
    
    sheet_name = table_name;
    
    filename = 'tables.xlsx';
    
    % Read the data from the .xlsx file and specified sheet
    dataTable = readtable(filename, 'Sheet', sheet_name, 'PreserveVariableNames', true);

    % Check if the given_value is within the range of the given_item column
    if given_value < min(dataTable{:, given_item}) || given_value > max(dataTable{:, given_item})
        error('The given_value is outside the range of the data in the table');
    end

    % Get the data for the given_item and item_wanted columns
    x_data = dataTable{:, given_item};
    y_data = dataTable{:, item_wanted};

    if strcmp(given_item, 'A_Astar') || strcmp(given_item, 'pt_ptstar') || strcmp(given_item, 'Smax_R') || strcmp(given_item, 'Tt_Ttstar') || strcmp(given_item, 'fLmax_D')
        % Split the data into two separate tables
        split_index = 100;
        x_data_1 = x_data(1:split_index);
        y_data_1 = y_data(1:split_index);
        x_data_2 = x_data(split_index + 1:end);
        y_data_2 = y_data(split_index + 1:end);
        % Use linear interpolation to find the value of item_wanted for the given_value in both tables
        value_1 = interp1(x_data_1, y_data_1, given_value, 'linear', 'extrap');
        value_2 = interp1(x_data_2, y_data_2, given_value, 'linear', 'extrap');
        % return both values to let user decide
        value = [value_1,value_2];

    elseif strcmp(given_item, 'nu') || strcmp(given_item, 'mu') || strcmp(item_wanted, 'nu') || strcmp(item_wanted, 'mu')
        % remove null values manually
        split_index = 100;
        x_data = x_data(split_index:end);
        y_data = y_data(split_index:end);
        % return normal linear interpolation on new cleaned data
        value = interp1(x_data, y_data, given_value, 'linear', 'extrap');

    else
        % simply do linear inperpolation on good data
        value = interp1(x_data, y_data, given_value, 'linear', 'extrap');
        
    end
end
