import mysql.connector
import tkinter as tk
from tkinter import messagebox

# Conexión a la base de datos MySQL
def conectar_mysql():
    return mysql.connector.connect(
        host="localhost",
        user="root",
        password="1234",
        database="Hidroponica"
    )

# Función para insertar registros en cada tabla
def insertar_registros():
    conexion = conectar_mysql()
    cursor = conexion.cursor()

# Función para consultar registros
def consultar_tabla():
    def mostrar_consulta():
        tabla = entry_tabla.get()
        conexion = conectar_mysql()
        cursor = conexion.cursor()
        cursor.execute(f"SELECT * FROM {tabla}")
        resultados = cursor.fetchall()
        text_resultados.delete("1.0", tk.END)
        for fila in resultados:
            text_resultados.insert(tk.END, f"{fila}\n")
        cursor.close()
        conexion.close()

    ventana_consultar = tk.Toplevel()
    ventana_consultar.title("Consultar Registros")
    tk.Label(ventana_consultar, text="Tabla").grid(row=0, column=0)
    entry_tabla = tk.Entry(ventana_consultar)
    entry_tabla.grid(row=0, column=1)
    tk.Button(ventana_consultar, text="Consultar", command=mostrar_consulta).grid(row=1, column=0, columnspan=2)
    text_resultados = tk.Text(ventana_consultar)
    text_resultados.grid(row=2, column=0, columnspan=2)

# Función para actualizar un registro
def ventana_actualizar():
    def actualizar_registro():
        tabla = entry_tabla.get()
        columna = entry_columna.get()
        nuevo_valor = entry_nuevo_valor.get()
        condicion = entry_condicion.get()
        conexion = conectar_mysql()
        cursor = conexion.cursor()
        sql = f"UPDATE {tabla} SET {columna} = %s WHERE {condicion}"
        cursor.execute(sql, (nuevo_valor,))
        conexion.commit()
        cursor.close()
        conexion.close()
        messagebox.showinfo("Actualizar", f"Registro actualizado en {tabla}.")

    ventana = tk.Toplevel()
    ventana.title("Actualizar Registro")
    tk.Label(ventana, text="Tabla").grid(row=0, column=0)
    entry_tabla = tk.Entry(ventana)
    entry_tabla.grid(row=0, column=1)
    tk.Label(ventana, text="Columna").grid(row=1, column=0)
    entry_columna = tk.Entry(ventana)
    entry_columna.grid(row=1, column=1)
    tk.Label(ventana, text="Nuevo valor").grid(row=2, column=0)
    entry_nuevo_valor = tk.Entry(ventana)
    entry_nuevo_valor.grid(row=2, column=1)
    tk.Label(ventana, text="Condición (e.g., Id_Cultivo = 1)").grid(row=3, column=0)
    entry_condicion = tk.Entry(ventana)
    entry_condicion.grid(row=3, column=1)
    tk.Button(ventana, text="Actualizar", command=actualizar_registro).grid(row=4, column=0, columnspan=2)

# Función para eliminar un registro
def ventana_eliminar():
    def eliminar_registro():
        tabla = entry_tabla.get()
        condicion = entry_condicion.get()
        conexion = conectar_mysql()
        cursor = conexion.cursor()
        sql = f"DELETE FROM {tabla} WHERE {condicion}"
        cursor.execute(sql)
        conexion.commit()
        cursor.close()
        conexion.close()
        messagebox.showinfo("Eliminar", f"Registro eliminado de {tabla}.")

    ventana = tk.Toplevel()
    ventana.title("Eliminar Registro")
    tk.Label(ventana, text="Tabla").grid(row=0, column=0)
    entry_tabla = tk.Entry(ventana)
    entry_tabla.grid(row=0, column=1)
    tk.Label(ventana, text="Condición (e.g., Id_Cultivo = 3)").grid(row=1, column=0)
    entry_condicion = tk.Entry(ventana)
    entry_condicion.grid(row=1, column=1)
    tk.Button(ventana, text="Eliminar", command=eliminar_registro).grid(row=2, column=0, columnspan=2)

# Ventana principal
root = tk.Tk()
root.title("CRUD MySQL")

tk.Button(root, text="Insertar Registros", command=insertar_registros).grid(row=0, column=0)
tk.Button(root, text="Consultar Registros", command=consultar_tabla).grid(row=0, column=1)
tk.Button(root, text="Actualizar Registro", command=ventana_actualizar).grid(row=1, column=0)
tk.Button(root, text="Eliminar Registro", command=ventana_eliminar).grid(row=1, column=1)

root.mainloop()
