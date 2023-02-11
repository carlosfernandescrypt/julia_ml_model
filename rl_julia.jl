# Dados de treinamento
x = [1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0]
y = [1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0]

# Inicialização dos pesos
w = rand()
b = rand()

# Função de perda (MSE)
function mean_squared_error(x, y, w, b)
    N = length(x)
    error = 0.0
    for i in 1:N
        error += (y[i] - (w * x[i] + b)) ^ 2
    end
    return error / N
end

# Taxa de aprendizagem
α = 0.01

# Número de épocas
epochs = 100

# Loop de treinamento
for i in 1:epochs
    # Calcular gradientes
    dw = 0.0
    db = 0.0
    N = length(x)
    for j in 1:N
        dw += -2 * x[j] * (y[j] - (w * x[j] + b))
        db += -2 * (y[j] - (w * x[j] + b))
    end
    dw /= N
    db /= N

    # Atualizar pesos
    w -= α * dw
    b -= α * db

    # Calcular erro
    error = mean_squared_error(x, y, w, b)

    # Imprimir erro a cada 10 épocas
    if i % 10 == 0
        println("Época: $(i) | Erro: $(error)")
    end
end

println("Pesos finais: w = $(w), b = $(b)")