def parse_arguments():
    """
    Analiza los argumentos de la línea de comandos para la ruta del archivo.

    Devuelve:
        file_path (str): La ruta del archivo proporcionada por el usuario.
    """
   
    return file_path

def extract_year_from_path(file_path):
    """
    Extrae el año del nombre de la ruta.

    Devuelve:
        el año del documento de los datos.
    """
    
    return year

def data_already_exists(engine, table_name, year):
        """ Valida si los datos que queremos almacenar ya están en la base de datos. Para hacerlo:
        1. Usa el objeto "engine" para conectar con la base de datos.
        2. Crea una consulta SQL para verificar si hay algún registro en "table_name" que coincida con el "year" (año) proporcionado.
        3. Ejecuta la consulta SQL.
        
        Devuelve:
            True si los datos ya están almacenados en tu base de datos. False, de lo contrario. Analiza
            otros resultados posibles al consultar la tabla.
        """
    return exists

def load_data(file_path):
    # carga los datos en el DataFrame para operaciones posteriores
    return df

def preprocess_data(df, engine, threshold=0.5):
    """
    Args:
        df (pd.DataFrame): El DataFrame de entrada.
        threshold (flotante): La proporción de columnas que pueden contener '*' antes de que 
                                            se elimine la fila.
        
        Preprocesa el DataFrame eliminando las filas en las que la mayoría de las columnas contienen el 
    caracter '*'. Además, debe estandarizar los tipos de datos de las columnas a la estructura de datos
    adecuada. Explora diferentes archivos csv para analizar posibles problemas. Para hacerlo:
            
        1. Calcula el número de columnas.
        2. Determina cuántos caracteres '*' se permiten por fila en función del umbral.
        3. Filtra las filas que exceden del número permitido de '*'.
        4. Convierte columnas específicas al tipo entero ("integer").
        5. Renombra las columnas usando una lista predefinida de nombres nuevos.
        6. Devuelve el DataFrame limpio y formateado.
                
    Devuelve:
        pd.DataFrame: El DataFrame limpio.
    """
    # Calcula el número de columnas
     num_columns = # Tu código va aquí
    
    # Determina el número de '*' permitidos con base en el umbral especificado (threshold).
    allowed_stars = int(num_columns * threshold)

    # Filtra las filas en las que el número de '*' sobrepasa el umbral especificado permitido.
    cleaned_df = df[df.apply(lambda x: (x == '*').sum() <= allowed_stars, axis=1)]
       
        ## Tu código va aquí
    
    return cleaned_df

def create_db_engine(db_name): 
    """
    Crea la conexión de base de datos como "sqlite:///"
    1. Crea un string de conexión usando un nombre de base de datos conveniente. por ejemplo:
    "sqlite:///{nombre de tu db}.db". Almacénalo en una variable.
        2. Inicia un mecanismo de SQLAlchemy para la base de datos llamando a create_engine(). Aprobado
        la variable previa como un parámeto para esta función.
        3. Imprime un mensaje de confirmación de conexión.
        4. Devuelve el mecanismo de SQLAlchemy para más interacciones con la base de datos.
    """
    ###### TU CÓDIGO VA AQUÍ ######
    return conection 

def save_to_database(df, engine, table_name):
    """
    Guarda el dataframe limpio (df) en tu base de datos.
    1. El DataFrame se inserta en una tabla SQL especificada por table_name.
        2. Si la tabla ya existe, se anexan los nuevos datos.
        3. El índice del DataFrame se excluye de las columnas de la tabla.
        4. La conexión a la base de datos se gestiona utilizando el mecanismo proporcionado.
    """
