%THIS IS THE COMPLETE FINAL VERSION OF THE PROGRAM
%   *****PERIODIC TABLE SEARCH ENGINE******
%This script asks the user for a "search type"(name,number,mass)
%then it asks the user to input the information, then displays
%the name, atomic number and atomic mass of that element

% Adding the codition in the switch cases
%if the name/number/mass is invalid

data=fileread("table.txt"); % read in character arrays
variables=splitlines(data); % splitting the lines
all_elements=[]; % empty array which will contain all the elements

%A for loop to concatenate all the infomation into seperate columns
for i=[1:length(variables)]

    % concatenating, splitting and converting(to string) the info
    all_elements = [all_elements;strsplit(string(variables(i)), ',')];

end

%setting up each column vector with different information
names = all_elements(:,1);
atomicNum= all_elements(:,2);
atomicMass= all_elements(:,3);

%Creating a 4th array to concatinate the above arrays
table = [names atomicNum atomicMass];

%Setting the initial condition for the while loop
con = "yes";

%Geting an input from the user for the type of search 
searchType=input('How do you wanna search for the element, by "name", "atomic Number" or "atomic Mass"?', 's');
searchType = lower(searchType); %converting search type to lower case

%A while loop for the program to keep running until user types in "no"
while lower(con) == "yes" || lower(con) == "y" && lower(con) ~= "no"
    
    %A switch statement to run the search type which needs execution
    switch searchType
        
        case "name" %case where the search type is "name"
            element =input('What is the name of the element?','s');
            r = strcmpi(names,element);
            lowerElement = lower(element);%converting element to lowercase
            lowerName = lower(names(r));%converting name(r) to lower case
            if lowerElement == lowerName
                fprintf('\tName\tAtomicNum\tAtomicMass\n\n');
                disp(table(r,:));
            else
                fprintf('\n\t**INVALID NAME**\n\n');
            end
            
        case {"atomic number","number"} %case where the search type is "atomic number"
            number = input('What is the Atomic number of the element?', 's');
            r = strcmpi(atomicNum,number);
            if number == atomicNum(r)
                fprintf('\tName\tAtomicNum\tAtomicMass\n\n');
                disp(table(r,:));
            else
                fprintf('\n\t**INVALID ATOMIC NUMBER**\n\n');
            end
        
        case {"atomic mass","mass"} %case where the search type is "atomic mass"
           mass = input('What is the Atomic Mass of the element accurate to 3 decimal places?','s');
           r = strcmpi(atomicMass,mass);
           if mass == atomicMass(r)
           fprintf('\tName\tAtomicNum\tAtomicMass\n\n');
           disp(table(r,:));
           else
              fprintf('\n\t**INVALID MASS -- make sure it is rounded');
              fprintf(' of to 3 decimal places :-)\n\n');
           end
        
        otherwise %default case where the user input is non of the above
           fprintf('\n**Type of search is invalid**\n\n');
    end
    
    %Getting the user input to ask if the user want to continue or not
    con=input('Do you want to continue with your search?', 's');
    
    %An if statement inside the while loop which will only execute
    %if the user inputs "yes"
    if lower(con) == "yes" || lower(con) == "y"
        searchType=input('Do you want to search for the element, by "Name", "Atomic Number" or "Atomic Mass"?', 's');
        searchType=lower(searchType);
    end
end