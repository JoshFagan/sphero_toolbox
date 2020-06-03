# Toolbox Installation for Matlab 

***Important Notes:***
* Do not edit any of the files in the `sphero_toolbox`
    * These files provide prebuilt functions for you to use, if you edit them they will no longer work as intended
      <details>
      <summary>Optional Intuition Example</summary>
  
      We can calculate the sine of pi by using Matlab's built in ```sin``` function and running `sin(pi)`. We can also track down and modify the built in `sin` function, but if we do this and then call `sin(pi)` we will likely get a completely incorrect answer. The same would happen if you were to open and modify any of the files in `sphero_toolbox`.
      </details>
* Do not give your own Matlab files the same name as any file in `sphero_toolbox`
    * If you do, Matlab will use your file instead of the files defined in `sphero_toolbox`
      <details>
      <summary>Recommended Best Practice Example</summary>
  
      Before naming a file, check to make sure a file with that name does not already exist in Matlab's environment. We can check for the existance of a file/function called `hello_world` by running the command `which hello_world`. If any result other than "'hello_world' not found." is displayed then the file/function already exists and you should choose a different name.
      </details>
