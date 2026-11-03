semCampanha :: Int -> Int
semCampanha p = p

pontosEmDobro :: Int -> Int
pontosEmDobro = \p -> p * 2

bonus50 :: Int -> Int
bonus50 = \p -> p + 50

campanhaDaSemana :: Int -> Int
campanhaDaSemana = pontosEmDobro

calculaPontos :: (Int -> Int) -> Int -> Int
calculaPontos regra valor = regra valor

campanhaMultiplicadora :: Int -> (Int -> Int)
campanhaMultiplicadora n = \p -> p * n

campanhaBonus :: Int -> (Int -> Int)
campanhaBonus b = \p -> p + b

blackFriday :: Int -> Int
blackFriday = campanhaMultiplicadora 5

aniversarioCliente :: Int -> Int
aniversarioCliente = campanhaBonus 200

acumula :: (Int -> Int) -> (Int -> Int) -> Int -> Int
acumula primeira segunda valor = segunda (primeira valor)

main :: IO ()
main = do
  putStrLn "--- Desafio 1 ---"
  print (semCampanha 120)
  print (pontosEmDobro 120)
  print (bonus50 120)
  print (campanhaDaSemana 120)
  putStrLn "--- Desafio 2 ---"
  print (calculaPontos semCampanha 80)
  print (calculaPontos pontosEmDobro 80)
  print (calculaPontos bonus50 80)
  print (calculaPontos (\p -> p * 3) 80)
  print (calculaPontos (\p -> p * 2 + 10) 80)
  putStrLn "--- Desafio 3 ---"
  print (calculaPontos blackFriday 150)
  print (calculaPontos aniversarioCliente 150)
  print (calculaPontos (campanhaMultiplicadora 4) 25)
  print (calculaPontos (campanhaBonus 30) 25)
  putStrLn "--- Desafio 4 ---"
  print (acumula blackFriday aniversarioCliente 150)
  print (acumula aniversarioCliente blackFriday 150)
  print (acumula (campanhaMultiplicadora 3) (\p -> p + 100) 60)
