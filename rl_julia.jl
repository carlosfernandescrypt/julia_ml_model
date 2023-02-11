### trainig 
x = [1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0]
y = [1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0]

### weights
w = rand()
b = rand()

### mse fun
function mean_squared_error(x, y, w, b)
    N = length(x)
    error = 0.0
    for i in 1:N
        error += (y[i] - (w * x[i] + b)) ^ 2
    end
    return error / N
end

### learning rate
a = 0.01

### epochs
epochs = 100

### training loop
for i in 1:epochs
    ### calc grades
    dw = 0.0
    db = 0.0
    N = length(x)
    for j in 1:N
        dw += -2 * x[j] * (y[j] - (w * x[j] + b))
        db += -2 * (y[j] - (w * x[j] + b))
    end
    dw /= N
    db /= N

    ### refresh weights
    w -= a * dw
    b -= a * db

    ### error calc
    error = mean_squared_error(x, y, w, b)

    ### print error each 10 epoch
    if i % 10 == 0
        println("Época: $(i) | Erro: $(error)")
    end
end

println("Pesos finais: w = $(w), b = $(b)")
