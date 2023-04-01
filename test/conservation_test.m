classdef ConservationTestExample < matlab.unittest.TestCase
    % Creates 12 test points, one test point for the 15th day of every month of 2021
    	
    properties (TestParameter)
        x1 = [2 2 5 5]*1e4; y1 = [2 5 5 2]*1e4;
        x2 = [6 6 9 9]*1e4; y2 = [2 5 5 2]*1e4;
        x3 = [5.5 5.25 5.75]*1e4; y3 = [2 4 4]*1e4;
%         ConvexPoly = polyshape(x1,y1);
%         ConvexPoly(2) = polyshape(x2,y2);
%         ConvexPoly(3) = polyshape(x3,y3);
%         height.mean = 0.25;
%         height.delta = 0;
    end
    
    methods (Test)
        function testEnergyConservation(x1,y1,x2,y2,x3,y3)
           ConvexPoly(1) = polyshape(x1,y1);
           ConvexPoly(2) = polyshape(x2,y2);
           ConvexPoly(3) = polyshape(x3,y3);
           height.mean = 0.25;
           height.delta = 0;
            
          %% Two blocks crashing head on - no rotation
          Floe1 = initialize_floe_values(ConvexPoly(1), height); Floe1.Ui = 0.15; Floe1.Vi = 0.02;
          Floe2 = initialize_floe_values(ConvexPoly(2), height); Floe2.Ui = -0.1; Floe2.Vi = 0.02;


          [K,~]=Subzero_conservation([Floe1;Floe2],0);
          %[K,T] = energy([Floe1;Floe2],0)
          assert(K(end)/K(1)<1)
            
%             % Compute actual result
%             doyActual = dayofyear(dateStr);
%             
%             % Verify that the actual result matches the expected result
%             testCase.verifyEqual(doyActual,doyExpected)
        end
    end
    
end
