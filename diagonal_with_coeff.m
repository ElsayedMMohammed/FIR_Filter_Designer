
function a=diagonal_with_coeff(k,coeff)
% This function is to get a diagonal matrix whose
% values are multiplied by a given vector
% k--> is the order of the diagonal matrix
% coeff -> is the vector of coefficients
ks = ones(1,k);
a = diag(ks);
len = length(coeff);
L = floor(k/len);

if len >= k 
    a = a.*coeff(1,1:k);    
else
for i=0:len-1
    f=0;
    if i == (len-1) 
        f=1;       
    end
     a(i*L+1:(i+1)*L-f,:) = a(i*L+1:(i+1)*L-f,:)*coeff(i+1);
end
end
end
    