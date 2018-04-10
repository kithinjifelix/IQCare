﻿using IQCare.Registration.Core;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace IQCare.Registration.Infrastructure
{
    public class RegistrationRepository<TEntity> : IRegistrationRepository<TEntity> where TEntity : class
    {
        private readonly RegistrationContext _context;
        public RegistrationRepository(RegistrationContext context)
        {
            _context = context ?? throw new ArgumentNullException(nameof(context)); 
        }

        public async Task AddAsync(TEntity entity)
           => await _context.AddAsync(entity);

        public async Task AddRangeAsync(IEnumerable<TEntity> entities)
            => await _context.AddRangeAsync(entities);

        public async Task<TEntity> FindAsync(Expression<Func<TEntity, bool>> predicate)
            => await _context.Set<TEntity>()
                .Where(predicate)
                .FirstOrDefaultAsync();

        public TEntity FindById(object id)
            => _context.Find<TEntity>(id);

        public async Task<TEntity> FindByIdAsync(object id)
            => await _context.FindAsync<TEntity>(id);

        public IQueryable<TEntity> Get(Expression<Func<TEntity, bool>> filter = null, Func<IQueryable<TEntity>, IOrderedQueryable<TEntity>> orderBy = null, List<Expression<Func<TEntity, object>>> includeProperties = null, int? page = null, int? pageSize = null)
        {
            var query = _context.Set<TEntity>().AsQueryable();

            if (includeProperties != null)
                includeProperties.ForEach(i => { query.Include(i); });

            if (filter != null)
                query = query.Where(filter);

            if (orderBy != null)
                query = orderBy(query);

            if (page != null && pageSize != null)
                query = query.Skip((page.Value - 1) * pageSize.Value).Take(pageSize.Value);

            return query;
        }

        public async Task<int> ExecWithStoreProcedureAsync(string query, params object[] parameters)
        {
            throw new NotImplementedException();
        }

        public IQueryable<TEntity> FromSql(string query, params object[] parameters)
        {
            throw new NotImplementedException();
        }

        public async Task<IEnumerable<TEntity>> GetAllAsync()
            => await _context.Set<TEntity>().ToListAsync();
    }
}
