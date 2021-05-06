%% Willmott Index calculation 
% ###### KNR & 06/05/2021 &##############
% The Willmott index is a more advanced method
% to evaluate the land surface model performance than previously
% reported methods (e.g., Medlyn et al., 2005).
% Some of the statistical methods widely used to evaluate model performance
% with observed data are Pearson correlation coefficient (r), coefficient of determination (r2), 
% mean absolute error (MAE), root mean square error (RMSE), and others.
% These traditional methods, however, are not always optimal
% for evaluating the model–data agreement or disagreement.
% For example, r or r2 methods can indicate the overall linear
% covariation between data and model results, but need to combine
% with the slope and intercept of the linear regression to
% evaluate the degree to which the observed results is captured
% by the model. Contrastingly, Willmott’s index is sensitive to
% differences between the measured and modeled values and
% itself can express the degree to how much measured variation
% can be captured by the model (Willmott, 1981).
%#########################################################################
% The range of refined Willmott’s index, dr, is from −1 to 1. 
% A dr of 1 indicates perfect agreement between model and observation, 
% and a dr of −1 indicates either lack of agreement between the model and observation 
% or insufficient variation in observations to test the model adequately.
%#########################################################################
function dr_ = willmontt_index(Mod_data,Obs_data)
    if (size(Mod_data) == size(Obs_data))
        %N = size(Mod_data);
        Obs_mean = squeeze(mean(Obs_data));
        Term1 = sum(abs(Mod_data - Obs_data));
        Term2 = 2.*sum(abs(Obs_data - Obs_mean));
        if Term1 <= Term2
            dr_ = 1-(Term1./Term2);
        elseif Term1> Term2
            dr_ = (Term2./Term1) - 1;
        end
    else
       disp 'Size of model and observation data is not matching'
    end
end