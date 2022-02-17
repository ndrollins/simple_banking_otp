#defmodule TheOtp.SimpleTreasury do

  #def open() do
    #loop(0)
  #end

  #def loop(balance) do
    #receive do
      #{:store, amount} ->
        #loop(balance + amount)
      #{:withdraw, amount} ->
        #loop(balance - amount)
      #{:balance, pid} ->
        #send(pid, balance)
        #loop(balance)
      #_ ->
        #loop(balance)
    #end
  #end
#end


defmodule TheOtp.Treasury do
  use GenServer

  #CLIENT
  
  def open() do
    GenServer.start_link(__MODULE__, 0, name: __MODULE__)
  end

  def store(amount) do
    GenServer.cast(__MODULE__, {:store, amount})
  end

  def withdraw(amount) do
    GenServer.cast(__MODULE__, {:withdraw, amount})
  end

  def get_balance() do
    GenServer.call(__MODULE__, :balance)
  end

  #CALLBACKS 

  def init(balance) do
    {:ok, balance}
  end

  def handle_cast({:store, amount}, balance) do
    {:noreply, balance + amount}
  end

  def handle_cast({:withdraw, amount}, balance) do
    {:noreply, balance - amount}
  end

  def handle_call(:balance, _from, balance) do
    {:reply, balance, balance}
  end 
end
