﻿using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using System.Linq.Expressions;
using System.Linq;

namespace IQCare.SharedKernel.Interfaces
{
    public interface IRepository<TEntity> where TEntity : class
    {
        TEntity FindById(object id);
        Task<TEntity> FindByIdAsync(object id);
        Task AddAsync(TEntity entity);
        void Update(TEntity entity);
        Task AddRangeAsync(IEnumerable<TEntity> entities);
        Task<IEnumerable<TEntity>> GetAllAsync();
        Task<TEntity> FindAsync(Expression<Func<TEntity, bool>> predicate);
        IQueryable<TEntity> Get(
            Expression<Func<TEntity, bool>> filter = null,
            Func<IQueryable<TEntity>, IOrderedQueryable<TEntity>> orderBy = null,
            List<Expression<Func<TEntity, object>>> includeProperties = null,
            int? page = null,
            int? pageSize = null);

        Task<int> ExecWithStoreProcedureAsync(string query, params object[] parameters);

        Task<List<TEntity>> FromSql(string query, params object[] parameters);

    }
}